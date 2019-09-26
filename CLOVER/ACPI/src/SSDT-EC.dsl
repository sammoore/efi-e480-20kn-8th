// Add active EC device to configuration for matching AppleBusPowerController
// see: https://www.tonymacx86.com/threads/guide-usb-power-property-injection-for-sierra-and-later.222266/
// ====
//
// Inject Fake EC device
DefinitionBlock("", "SSDT", 2, "hack", "EC", 0)
{
	Device(_SB.EC)
	{
		Name(_HID, "EC000000")
	}
}
//EOF
