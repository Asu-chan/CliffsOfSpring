#include <game.h>
#include <common.h>
#include <actors.h>

extern "C" void OrR5AgaginstByteFromWorldAvailableArrayAt0x32ofWorldData(SaveBlock *save, u32 unk1, u32 unk2);
extern "C" void SaveCurrentData_Maybe(SaveFile *save);
extern "C" void create_hash_for_savefile(SaveFile *save);
extern "C" void WriteSavefileToRegularBuffer(SaveFile *save);

extern "C" void ClearR5FromByteInWorldAvailableArrayAt0x32ofWorldData(SaveBlock *save, u32 unk1, u32 unk2);
extern "C" u32 AssembleDefaultScWorldMapSettings();

void NoOpeningCutscene() {
	// So quick explanation, we make the save think we saw the W1 cutscene already and then write this save to memory, and then edit it to make the cutscene play but do not write it to memory this time.
	// This way, the animation plays but when exiting and coming back, it doesn't replay
	// Clever Nintendo, very clever...

	SaveFile* save = GetSaveFile();
	SaveBlock* saveBlock = save->GetBlock(-1);

	// Stolen from 80922ED0
	OrR5AgaginstByteFromWorldAvailableArrayAt0x32ofWorldData(saveBlock, 0, 1);
	SaveCurrentData_Maybe(save);
	create_hash_for_savefile(save);
	WriteSavefileToRegularBuffer(save);

	// Stolen from 80922F80
	ClearR5FromByteInWorldAvailableArrayAt0x32ofWorldData(saveBlock, 0, 1);
	ActivateWipe(WIPE_FADE);
	DoSceneChange(WORLD_MAP, AssembleDefaultScWorldMapSettings(), 0);
	

}