// F3 Functions

class F // Defines the "owner"
{
	class common // category
	{
		file = "f\common";
		class processParamsArray{preInit = 1; postInit=1;};
		class nearPlayer{};
	};
	class assignGear
	{
		file = "f\assignGear";
		class assignGear{};
	};
	class assignGearAI
	{
		file = "f\assignGear";
		class assignGearAI{};
	};
	class groupMarkers {
		file = "f\groupMarkers";
		class localGroupMarker{};
		class localSpecialistMarker{};
	};
	class FTMemberMarkers
	{
		file = "f\FTMemberMarkers";
		class SetLocalFTMemberMarkers{};
		class GetMarkerColor{};
		class LocalFTMarkerSync{};
	};
	class nametag
	{
		file = "f\nametag";
		class drawNameTag{};
	};
	class tfr
	{
		file = "f\radios\tfr";
		class tfr_removeRadios{};
		class tfr_addRadios{};
		class tfr_setRadioFreq{};
		class tfr_setRadioFrequencies{ preInit = 1; };
		class tfr_configureSpectatorChat{};
	};
	class safeStart
	{
		file = "f\safeStart";
		class safety{};
	};
};