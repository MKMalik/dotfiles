#!/bin/bash

# Launch Rofi with greenclip, and capture the selected item
SELECTED_CLIP=$(rofi -modi "clipboard:greenclip print" -show clipboard -run-command '{cmd}')

# If an item was selected, copy it to the clipboard
if [ -n "$SELECTED_CLIP" ]; then
    echo -n "$SELECTED_CLIP" | wl-copy
    # Optionally, simulate a paste (this is the tricky part on Wayland)
    # Wayland compositors often don't allow arbitrary "type" or "paste" events
    # from external scripts for security reasons.
    # Some applications *might* respond to a synthetic paste event if wl-paste supports it
    # but it's highly dependent on the application and compositor.
    # A direct "wl-paste" command just outputs the clipboard content, it doesn't paste into a window.

    # For actual pasting, you'd usually need something like ydotool or wtype,
    # but these often require specific setup (e.g., udev rules for ydotool)
    # and are generally not recommended for simple clipboard pasting due to complexity and potential issues.
    #
    # If you really want a single shortcut paste, you'll likely need to use a different clipboard manager
    # designed specifically for Wayland that includes a "type" or "paste" action.
    #
    # For greenclip, stick to the two-step (select in rofi, then Ctrl+V).
fi
