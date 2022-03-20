.text
.align 4
#include <asm_setup.S>

.global NoMoreUpMultiPressOnWMAPPause
NoMoreUpMultiPressOnWMAPPause:
	cmpwi r3, 2
	beq doMinusTwo
	addic. r0, r3, -1
	blr
doMinusTwo:
	addic. r0, r3, -2
	blr

.global NoMoreDownMultiPressOnWMAPPause
NoMoreDownMultiPressOnWMAPPause:
	cmpwi r3, 0
	beq doPlusTwo
	addi r0, r3, 1
	blr
doPlusTwo:
	addi r0, r3, 2
	blr

