// SSDT-UIAC-ALL.dsl
//
// This SSDT can be used as a template to build your own
// customization for USBInjectAll.kext.
//
// This SSDT contains all ports, so using it is the same as without
// a custom SSDT.  Delete ports that are not connected or ports you
// do not need.
//
// Change the UsbConnector or portType as needed to match your
// actual USB configuration.
//
// Note:
// portType=0 seems to indicate normal external USB2 port (as seen in MacBookPro8,1)
// portType=2 seems to indicate "internal device" (as seen in MacBookPro8,1)
// portType=4 is used by MacBookPro8,3 (reason/purpose unknown)
//
// UsbConnector=0 seems to indicate USB-2.0 without associated USB-3.0 "port"
// UsbConnector=3 seems to indicate USB-3.0, or USB-2.0 on the same port as a 3.0 "port"
// UsbConnector=9 seems to indicate USB-C
// UsbConnector=255 seems to indicate internal ports that stay on; sometimes used to solve sleep issues?

DefinitionBlock ("", "SSDT", 2, "hack", "_UIAC", 0)
{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            "8086_a36d", Package()
            {
                // must count all ports, even commented out, up to last uncommented out
                "port-count", Buffer() { 20, 0, 0, 0 },
                "ports", Package()
                {
//                    // internal USB-2.0 header
//                    "HS01", Package()
//                    {
//                        "UsbConnector", 255,
//                        "port", Buffer() { 1, 0, 0, 0 },
//                    },
//                    "HS02", Package()
//                    {
//                        "UsbConnector", 255,
//                        "port", Buffer() { 2, 0, 0, 0 },
//                    },
                    "HS03", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 3, 0, 0, 0 },
                    },
                    "HS04", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 4, 0, 0, 0 },
                    },
                    "HS05", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 5, 0, 0, 0 },
                    },
                    "HS06", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 6, 0, 0, 0 },
                    },
//                    // is this ever used?
//                    "HS07", Package()
//                    {
//                        "UsbConnector", 3,
//                        "port", Buffer() { 7, 0, 0, 0 },
//                    },
                    "HS08", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 8, 0, 0, 0 },
                    },
                    "HS09", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 9, 0, 0, 0 },
                    },
//                    // HS10,HS11: internal USB-3.0 header (used for case ports); pair with SS07,SS08
//                    "HS10", Package()
//                    {
//                        "UsbConnector", 3,
//                        "port", Buffer() { 10, 0, 0, 0 },
//                    },
//                    "HS11", Package()
//                    {
//                        "UsbConnector", 3,
//                        "port", Buffer() { 11, 0, 0, 0 },
//                    },
//                    // HS12,HS13: is this ever used?
//                    "HS12", Package()
//                    {
//                        "UsbConnector", 3,
//                        "port", Buffer() { 12, 0, 0, 0 },
//                    },
//                    "HS13", Package()
//                    {
//                        "UsbConnector", 3,
//                        "port", Buffer() { 13, 0, 0, 0 },
//                    },
                    // Internal Wifi/Bluetooth
                    "HS14", Package()
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 14, 0, 0, 0 },
                    },
                    // backplate ports SS01,...,SS06
                    "SS01", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 17, 0, 0, 0 },
                    },
                    "SS02", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 18, 0, 0, 0 },
                    },
                    "SS03", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 19, 0, 0, 0 },
                    },
                    "SS04", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 20, 0, 0, 0 },
                    },
                    "SS05", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 21, 0, 0, 0 },
                    },
                    "SS06", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 22, 0, 0, 0 },
                    },
//                    // SS07,SS08: internal USB-3.0 header (used for case ports); pair with HS10,HS11
//                    "SS07", Package()
//                    {
//                        "UsbConnector", 3,
//                        "port", Buffer() { 23, 0, 0, 0 },
//                    },
//                    "SS08", Package()
//                    {
//                        "UsbConnector", 3,
//                        "port", Buffer() { 24, 0, 0, 0 },
//                    },
//                    // Remainder: are these even used?
//                    "SS09", Package()
//                    {
//                        "UsbConnector", 3,
//                        "port", Buffer() { 25, 0, 0, 0 },
//                    },
//                    "SS10", Package()
//                    {
//                        "UsbConnector", 9, // rj510 on tmx86 says 9 or 255, not sure why
//                        "port", Buffer() { 26, 0, 0, 0 },
//                    },
//                    "USR1", Package()
//                    {
//                        "UsbConnector", 3,
//                        "port", Buffer() { 15, 0, 0, 0 },
//                    },
//                    "USR2", Package()
//                    {
//                        "UsbConnector", 3,
//                        "port", Buffer() { 16, 0, 0, 0 },
//                    },
                },
            },
        })
    }
}
//EOF
