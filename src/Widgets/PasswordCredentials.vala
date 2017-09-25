/*
* Copyright (c) 2011-2017 elementary LLC. (http://launchpad.net/pantheon-greeter)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA.
*
*/

public class PasswordCredentials : Gtk.Entry, Credentials {
    public PasswordCredentials () {
        Object (
            caps_lock_warning: true,
            hexpand: true,
            visibility: false
        );
    }

    construct {
        set_icon_from_icon_name (Gtk.EntryIconPosition.PRIMARY, "dialog-password-symbolic");
        set_icon_from_icon_name (Gtk.EntryIconPosition.SECONDARY, "go-jump-symbolic");
        set_icon_tooltip_text (Gtk.EntryIconPosition.SECONDARY, _("Log In"));

        activate.connect (() => {
            replied (text);
        });

        icon_press.connect ((pos, event) => {
            if (pos == Gtk.EntryIconPosition.SECONDARY) {
                replied (text);
            }
        });
    }
    
    public void show_message (LightDM.MessageType type, MessageText messagetext = MessageText.OTHER, string text = "") {
        // there are no messages to display
    }
}
