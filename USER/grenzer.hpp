class Grenzer {
	class AllUnits {
		uniform = "gm_gc_army_uniform_soldier_80_str";
		vest = "gm_gc_bgs_vest_80_border_str";
		backpack = "";
		headgear = "gm_gc_bgs_headgear_hat_80_gry";
		primaryWeapon = "rhs_weap_ak74_2";
		primaryWeaponOptics = "";
		primaryWeaponPointer = "rhs_acc_2dpzenit";
		primaryWeaponMuzzle = "rhs_acc_dtk1983";
		primaryWeaponUnderbarrel = "";
		primaryWeaponMagazine = "gm_30Rnd_545x39mm_B_T_7t3_ak74_prp";
		secondaryWeapon = "";
		secondaryWeaponMagazine = "";
		handgunWeapon = "";
		handgunWeaponMagazine = "";
		binoculars = "gm_df7x40_blk";
		map = "ItemMap";
		compass = "ItemCompass";
		watch = "ItemWatch";
		gps = "";
		radio = "";
    nvgoggles = "";
		};
		class Type {
				//Rifleman aka normaler Grenzer
				class soldier_F {
						addItemsToUniform[] = {
							LIST_1("ACE_MapTools"),
							LIST_1("ACE_Flashlight_KSF1"),
							LIST_1("ACE_epinephrine"),
							LIST_1("ACE_morphine"),
							LIST_2("ACE_splint"),
							LIST_2("ACE_tourniquet"),
							LIST_4("ACE_fieldDressing"),
							LIST_2("ACE_elasticBandage"),
							LIST_2("ACE_packingBandage"),
							LIST_1("ACE_EntrechingTool")

						};
						addItemsToVest[] = {
							LIST_8("gm_30Rnd_545x39mm_B_T_7T3_ak74_prp"),
							LIST_2("gm_smokeshell_blk_gc"),
							LIST_2("gm_handgrenade_frag_rgd5"),
							LIST_1("gm_smokeshell_red_gc"),
							LIST_1("ACE_HandFlare_Red")

						};
				};

				//Asst. Autorifleman
				class soldier_AAR_F: Soldier_F {

				};

				//Asst. Gunner (HMG/GMG)
				class support_AMG_F: Soldier_F {

				};

				//Asst. Missile Specialist (AA)
				class soldier_AAA_F: Soldier_F {

				};

				//Asst. Missile Specialist (AT)
				class soldier_AAT_F: Soldier_F {

				};

				//Autorifleman
				class soldier_AR_F: Soldier_F {
					vest = "gm_gc_army_vest_80_lmg_str";
					primaryWeapon = "rhs_weap_pm63";
					primaryWeaponOptics = "";
					primaryWeaponPointer = "rhs_acc_2dpzenit";
					primaryWeaponMuzzle = "rhs_acc_dtkakm";
					primaryWeaponUnderbarrel = "";
					primaryWeaponMagazine = "gm_75Rnd_762x39mm_B_T_57N231P_ak47_blk";
					
					addItemsToUniform[] = {
							LIST_1("ACE_MapTools"),
							LIST_1("ACE_Flashlight_KSF1"),
							LIST_1("ACE_epinephrine"),
							LIST_1("ACE_morphine"),
							LIST_2("ACE_splint"),
							LIST_2("ACE_tourniquet"),
							LIST_4("ACE_fieldDressing"),
							LIST_2("ACE_elasticBandage"),
							LIST_2("ACE_packingBandage"),
							LIST_1("ACE_EntrechingTool")

					};
					addItemsToVest[] = {
							LIST_2("gm_75Rnd_762x39mm_B_T_57N231P_ak47_blk"),
							LIST_4("gm_30Rnd_762x39mm_B_T_57N231P_ak47_blk"),
							LIST_1("gm_smokeshell_blk_gc"),
							LIST_1("ACE_HandFlare_Red")
					};

				};

				//Combat Life Saver
				class medic_F: Soldier_F {

				};

				//Explosive Specialist
				class soldier_exp_F: Soldier_F {

				};

				//Grenadier
				class Soldier_GL_F: Soldier_F {

				};

				//Heavy Gunner
				class HeavyGunner_F: Soldier_F {

				};

				//Marksman
				class soldier_M_F: Soldier_F {
						primaryWeapon = "rhs_weap_aks74n_2";
						primaryWeaponOptics = "rhs_acc_1p29";
						primaryWeaponPointer = "rhs_acc_2dpzenit";
						primaryWeaponMuzzle = "rhs_acc_dtk1983";
						primaryWeaponUnderbarrel = "";
						primaryWeaponMagazine = "gm_30Rnd_545x39mm_B_T_7t3_ak74_prp";
					
					addItemsToUniform[] = {
							LIST_1("ACE_MapTools"),
							LIST_1("ACE_Flashlight_KSF1"),
							LIST_1("ACE_epinephrine"),
							LIST_1("ACE_morphine"),
							LIST_2("ACE_splint"),
							LIST_2("ACE_tourniquet"),
							LIST_4("ACE_fieldDressing"),
							LIST_2("ACE_elasticBandage"),
							LIST_2("ACE_packingBandage"),
							LIST_1("ACE_EntrechingTool")

						};
						addItemsToVest[] = {
							LIST_8("gm_30Rnd_545x39mm_B_T_7T3_ak74_prp"),
							LIST_2("gm_smokeshell_blk_gc"),
							LIST_2("gm_handgrenade_frag_rgd5"),
							LIST_1("gm_smokeshell_red_gc"),
							LIST_1("ACE_HandFlare_Red")

						};

				};

				//Missile Specialist (AA)
				class soldier_AA_F: Soldier_F {

				};

				//Missile Specialist (AT)
				class soldier_AT_F: Soldier_F {

				};

				//Repair Specialist
				class soldier_repair_F: Soldier_F {

				};

				//Rifleman (AT)
				class soldier_LAT_F: Soldier_F {

				};

				//Sniper
				class Sniper_F: Soldier_F {

				};

				//Squad Leader
				class Soldier_SL_F: Soldier_F {

				};

				//Spotter
				class Spotter_F: Soldier_F {

				};

				//Team Leader
				class Soldier_TL_F: Soldier_F {

				};
		};
};
