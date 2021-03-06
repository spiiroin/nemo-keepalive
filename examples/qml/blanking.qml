/* ------------------------------------------------------------------------- *
 * Copyright (C) 2014 Jolla Ltd.
 * Contact: Martin Jones <martin.jones@jollamobile.com>
 * License: BSD
 * ------------------------------------------------------------------------- */

import QtQuick 2.0
import Sailfish.Silica 1.0
import org.nemomobile.keepalive 1.1

ApplicationWindow {
    property string displayStatus: DisplayBlanking.status == DisplayBlanking.Off ? "off"
                                   : (DisplayBlanking.status == DisplayBlanking.Dimmed
                                   ? "dimmed" : "on")
    onDisplayStatusChanged: console.log("Display blanking status:", displayStatus)

    initialPage: Component {
        Page {
            Column {
                width: parent.width
                spacing: Theme.paddingLarge
                TextSwitch {
                    text: "Prevent blanking"
                    onCheckedChanged: DisplayBlanking.preventBlanking = checked
                }
                Label {
                    x: Theme.paddingLarge
                    text: "Display is " + displayStatus
                }
            }
        }
    }
}
