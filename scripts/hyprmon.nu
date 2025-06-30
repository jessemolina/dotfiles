#!/usr/bin/env nu

# Hyprland Monitor Configuration Script
# Usage: hyprmon [laptop|desktop|projector|status|list]

def main [mode?: string] {
    # Monitor configurations based on your setup
    let configs = {
        laptop: [
            "eDP-1,1920x1080@60.01,0x0,1",
            "DP-2,disable",
            "DP-1,disable"
        ],
        desktop: [
            "eDP-1,disable",
            "DP-1,1920x1080@60,0x0,1",
            "DP-2,1920x1080@60,1920x0,1"
        ],
        projector: [
            "eDP-1,1920x1080@60.01,0x0,1",
            "DP-2,disable",
            "DP-1,1920x1080@60,1920x0,1"
        ]
    }
    
    # Check if hyprctl is available
    if not (which hyprctl | is-not-empty) {
        print $"(ansi red)Error: hyprctl not found. Make sure Hyprland is running.(ansi reset)"
        exit 1
    }
    
    match $mode {
        null => {
            show_help
        },
        "status" => {
            show_current_monitors
        },
        "list" => {
            list_available_monitors
        },
        _ => {
            if ($mode in ($configs | columns)) {
                set_monitor_config $configs $mode
            } else {
                print $"(ansi red)Error: Unknown mode '($mode)'(ansi reset)"
                print ""
                show_help
                exit 1
            }
        }
    }
}

# Set monitor configuration
def set_monitor_config [configs: record, mode: string] {
    print $"(ansi green)Setting monitor configuration: ($mode)(ansi reset)"
    
    let commands = $configs | get $mode
    
    for command in $commands {
        print $"  Executing: hyprctl keyword monitor ($command)"
        
        let result = (hyprctl keyword monitor $command | complete)
        
        if $result.exit_code != 0 {
            print $"(ansi red)  Error: ($result.stderr)(ansi reset)"
        } else {
            print $"(ansi green)  ✓ Success(ansi reset)"
        }
    }
    
    # Restart waybar to handle monitor configuration changes
    restart_waybar
    
    print $"(ansi green)Monitor configuration '($mode)' applied successfully!(ansi reset)"
}

# Show current monitor status
def show_current_monitors [] {
    print $"(ansi blue)Current Monitor Configuration:(ansi reset)"
    print ""
    
    let monitors = (hyprctl monitors -j | from json)
    
    for monitor in $monitors {
        let status = if $monitor.disabled { "DISABLED" } else { "ENABLED" }
        let resolution = $"($monitor.width)x($monitor.height)@($monitor.refreshRate)Hz"
        let position = $"($monitor.x),($monitor.y)"
        let scale = $monitor.scale
        
        print $"  (ansi cyan)($monitor.name)(ansi reset):"
        print $"    Status: ($status)"
        if not $monitor.disabled {
            print $"    Resolution: ($resolution)"
            print $"    Position: ($position)"
            print $"    Scale: ($scale)"
        }
        print ""
    }
}

# List all available monitors
def list_available_monitors [] {
    print $"(ansi blue)Available Monitors:(ansi reset)"
    print ""
    
    let monitors = (hyprctl monitors -j | from json)
    
    for monitor in $monitors {
        print $"  • (ansi cyan)($monitor.name)(ansi reset) - ($monitor.description)"
    }
    print ""
    
    print $"(ansi yellow)Note: Use these names in your configuration.(ansi reset)"
}

# Show help information
def show_help [] {
    print $"(ansi blue)Hyprland Monitor Configuration Script(ansi reset)"
    print ""
    print $"(ansi green)Usage:(ansi reset)"
    print "  hyprmon [mode]"
    print ""
    print $"(ansi green)Available modes:(ansi reset)"
    print "  laptop     - Enable only laptop screen"
    print "  desktop    - DP-1 (left) + DP-2 (right), laptop disabled"
    print "  projector  - External monitor only (laptop disabled)"
    print "  status     - Show current monitor configuration"
    print "  list       - List all available monitors"
    print ""
    print $"(ansi green)Examples:(ansi reset)"
    print "  hyprmon laptop"
    print "  hyprmon desktop"
    print "  hyprmon status"
    print ""
    print $"(ansi yellow)Note: Edit the script to customize monitor names and resolutions for your setup.(ansi reset)"
}

# Restart waybar to handle monitor changes properly
def restart_waybar [] {
    if not (which waybar | is-not-empty) {
        return
    }
    
    print $"(ansi yellow)Restarting waybar for new monitor configuration...(ansi reset)"
    
    # Kill all waybar processes using pkill for more reliable termination
    let result = (pkill waybar | complete)
    
    if $result.exit_code == 0 {
        print $"  ✓ Stopped existing waybar processes"
    }
    
    # Wait a moment for cleanup
    sleep 1sec
    
    # Start waybar in background
    print $"  Starting waybar..."
    
    # Use nohup to properly detach waybar from the script
    bash -c "nohup waybar >/dev/null 2>&1 & disown" | ignore
    
    # Give waybar time to initialize
    sleep 2sec
    
    print $"(ansi green)  ✓ Waybar restarted successfully(ansi reset)"
}

# Configuration validation
def validate_config [] {
    print $"(ansi blue)Validating configuration...(ansi reset)"
    
    # Check if we're in a Hyprland session
    if ($env.XDG_CURRENT_DESKTOP? != "Hyprland") and ($env.HYPRLAND_INSTANCE_SIGNATURE? == null) {
        print $"(ansi yellow)Warning: Not running in Hyprland session(ansi reset)"
    }
    
    # Test hyprctl connectivity
    let test_result = (hyprctl version | complete)
    if $test_result.exit_code != 0 {
        print $"(ansi red)Error: Cannot communicate with Hyprland(ansi reset)"
        exit 1
    }
    
    print $"(ansi green)✓ Configuration valid(ansi reset)"
}
