// Credit: RehabMan
// taken from: https://raw.githubusercontent.com/RehabMan/OS-X-Voodoo-PS2-Controller/8a4bbfad6f4e374eb04ef9727b737b7940a81ec5/SSDT-Swap-LeftControlCapsLock.dsl
//
// Changelog:
//   - modified to match ThinkPad LPCB.KBD path
//
// ====

// This sample shows how to remap the Left Control to CapsLock,
// and CapsLock to Left Control.
// Be sure to specify the correct path to your device, followed by ".RMCF"
// For example, a Lenovo x1 Carbon 5th Gen would be "_SB.PCI0.LPCB.KBD.RMCF"
DefinitionBlock ("", "SSDT", 2, "hack", "ps2", 0)
{
    Name(_SB.PCI0.LPCB.KBD.RMCF, Package()
    {
        "Keyboard", Package()
        {
            "Custom ADB Map", Package()
            {
                Package(){},
                "3a=3b",    // 3a is PS2 for capslock, 3b is ADB for left control (normal map is 3a=39)
                "1d=39",    // 1d is PS2 for left control, 39 is ADB for caps lock (normal map is 1d=3b)
            },
        },
    })
}
//EOF
