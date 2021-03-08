/datum/species
	var/list/screamsounds = list('modular_citadel/sound/voice/scream_m1.ogg', 'modular_citadel/sound/voice/scream_m2.ogg')
	var/list/femalescreamsounds = list()
	var/fluff_desc = "No description."

/datum/species/synth
	screamsounds = list('modular_citadel/sound/voice/scream_silicon.ogg')
	fluff_desc = "An advanced model of IPCs, made not only to replicate humanoid behavior but also humanoid appearance. Although they were originally built to be humanlike, they come in various \"species\", and, of course, suffer under the same prejudices of other synthetics."

/datum/species/android
	screamsounds = list('modular_citadel/sound/voice/scream_silicon.ogg')
	fluff_desc = "Some may accidentally assume Androids are some form of IPC, but infact all androids are or were human at some point. Most androids arise from rampant technophilia or massive bodily repair."

/datum/species/ipc
	name = "I.P.C"
	screamsounds = list('modular_citadel/sound/voice/scream_silicon.ogg')
	fluff_desc = "IPCs are produced by Takyon Data Lattices LLC. and are considered sapient manufactured being. Usually they are owned directly by their employers, however are legally and socially treated as organics."

/datum/species/lizard
	screamsounds = list('modular_citadel/sound/voice/scream_lizard.ogg')
	fluff_desc = "Named Uthani in their native tongue of Draconic, Lizardmen are found throughout most Frontier worlds. They hail from the planet of Quetzal - A tropical planet covered in colossal trees and arid radioactive deserts. Most are hardy and well-traveled, going wherever they can get work."

/datum/species/skeleton
	screamsounds = list('modular_citadel/sound/voice/scream_skeleton.ogg')
	fluff_desc = "IT'S TOO LATE THE SKELETON ALREADY IS INSIDE OF YOU."

/datum/species/fly
	screamsounds = list('modular_citadel/sound/voice/scream_moth.ogg')
	fluff_desc = "Flypeople are at their most common genetically damaged sapients, who suffered extreme changes to their biology because of botched teletransportation technology. Some of them are however, simply variations of insectoids."

/datum/species/insect
	screamsounds = list('modular_citadel/sound/voice/scream_moth.ogg')
	fluff_desc = "Insectoids are a collection of species hailing from Ocellus-4, a world covered in marshes and opalescent oceans. They're diverse in both body and mind, making it hard to get a definitive summary of their personalities."

/datum/species/insect/moth
	screamsounds = list('modular_citadel/sound/voice/scream_moth.ogg')
	fluff_desc = "Mothpeople are a variant of Insectoids, however they're considered the dominant species of Ocellus-4, their homeworld. Covergently similar to old Terra moths, they have a strange facination with bright lights."

/datum/species/human
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Homo Sapiens Sapiens - Humans. They are the most widespread and abundant species throughout the galaxy, often considered the dominant species (mostly by themselves). After The Collapse, their old governments are a shadow of their former selves and corporations like Nanotrasen are the dominant governing bodies. Humans come in all shapes and sizes, and with the advent of genemodding even more so."

/datum/species/human/felinid
	fluff_desc = "Felinids are a subtype of genemodded humans, often colloquially (and pejoratively) called catpeople. They're on the lighter end of genemodding, usually having only tails and ears."

/datum/species/human/humanoid
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Humanoid is an umbrella term for sapient beings that share many physical similarities with humans, more so than anthropomorphs. Virtually all of them are genemodded humans."

/datum/species/human/humanoid/dunmer
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Dunmeri are native to the volcanic planet of Fumarole, a planet incredibly similar to NT8248-B. Due to the similarity, many freelance Dunmeri naturally seek out employment in this sector."

/datum/species/angel
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Some humans, either due to fanatic devotion to a religious doctrine or highly overestimated self worth, choose to genemod themselves to obtain a vestigial pair of wings."

/datum/species/corporate
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Corporate androids are advanced androids employed by NanoTrasen, or loaned out as mercenary forces to SolGov. Most of the time, they are high ranking CentCom officers."

/datum/species/dullahan
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Not much is known about the mysterious dullahan, but they sure know how to make someone lose their mind."

/datum/species/dwarf
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "The result of genetic modification for use in colonization efforts, Dwarves are extremely distant relatives of Humans. Originally made for planets with extreme gravity, Dwarves are much more bulky and short in their physiology; along with various other changes, the most unusual outcome was their biological dependence on alcohol to survive. If a Dwarf goes too long without alcohol, they will suffer similar effects to extreme dehydration in humans, eventually culminating in death."

/datum/species/anthro
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Anthropomorph is an umbrella term used to describe the vast majority of sapient species one might encounter within the galaxy. They can take almost any form, and can be found all across the stars."

/datum/species/anthro/mammal
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Mammal is an umbrella term used to describe sapient mammalian species one might encounter within the galaxy. They can take almost any form, and can be found all across the stars."

/datum/species/anthro/avian
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Avian is an umbrella term used to describe sapient avian species one might encounter within the galaxy. They can take almost any form, and can be found all across the stars."

/datum/species/anthro/aquatic
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Aquatic is an umbrella term used to describe sapient aquatic species one might encounter within the galaxy. They can take almost any form, and can be found all across the stars."

/datum/species/jelly
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Slimepeople are by and large the results of experimentation on various slime entities in control of various organizations, chief of which being Nanotrasen and their Xenobiological Research Department. While a vast majority of Slimepeople are the result of this experimentation, there exists many gel-like alien species in galaxy, along with those resultant from consumer-grade Nanotrasen brand Slime-Hybrid genemods."

/datum/species/plasmaman
	screamsounds = list('modular_citadel/sound/voice/scream_skeleton.ogg')
	fluff_desc = "Plasmamen are the result of the catastrophic, long-term fusion of standard organic physiology with liquid and airborne pools of high-density plasma extract. The changes resulting from this fusion often times leave no trace of the victims original biology or species, turning them into an entirely plasma-based lifeform. Plasmamen are extremely reactive with oxygenated environments, requiring specialized environment suits to survive in such conditions. While most Plasmamen are employed by Nanotrasen, there are known to be pockets of plasma civilization where environmental conditions allow for at the very least tentative existence without the need of outside support."

/datum/species/pod
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Podmen are largely products of adding the DNA of a Human in a Podplant in a emergency revival procedure. However there is the occasional amalgam plant being of indeterminate origin, although theorized to come from the Lizardpeople's jungle homeworld; Quetzal."

/datum/species/shadow
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Not much is known about Shadowpeople. Shadowfolk themselves don't know their origin, assuming that at some point they were themselves humans or similar."

/datum/species/synthliz
	screamsounds = list('modular_citadel/sound/voice/scream_silicon.ogg')
	fluff_desc = "Synthetic Lizardpeople are a variant of IPC, much more advanced in construction. Although benefitting from higher production quality and improved internal systems, they still suffer from all of the original problems that being a synthetic humanoid comes with."

/datum/species/vampire
	femalescreamsounds = list('modular_citadel/sound/voice/scream_f1.ogg', 'modular_citadel/sound/voice/scream_f2.ogg')
	fluff_desc = "Vampires are humans suffering from some form of affliction outside the realm of Science. Their metabolic systems are only capable of processing blood, which they require to sustain themselves."

/datum/species/vox
	screamsounds = list('modular_skyrat/sound/emotes/voxscream.ogg')
	fluff_desc = "Vox are a widespread avian species that require pure nitrogen gas to breath. They've lost much of their culture and homeworlds during The Collapse, most have taken to trading and piracy as a means to get by. What little of their old governments that exist are brutal bands of mercenaries and ritualist warriors. Amoungst other species, they're hardly popular."

/datum/species/xeno
	screamsounds = list('sound/voice/hiss6.ogg')
	fluff_desc = "Xenomorph hybrids were initially the result of faulty genetic experimentation with xenos by NanoTrasen researchers, but since then genemods for \"xenomorphication\" have become very popular among xenophilics. Although widely believed that they share some sort of affinity with normal xenomorphs, this is simply untrue - Xenomorphs are savage, and will ravage xenohybrids without any qualms."

/datum/species/zombie
	screamsounds = list('modular_skyrat/sound/zombie/zombie_scream.ogg')
	fluff_desc = "Zombies are the result of an as of yet largely unknown jailbroken Nanomachine software program, which overload the body by using natural metabolic and cardiovascular systems to constantly replicate themselves within a host. Hosts are extremely aggressive on account of neurological changes imposed by the nanomachines, driven to spread their affliction to anyone who isn't infected. While sapient zombies do exist, able to regulate their nanomachines to be nonlethal and overall benign, they still suffer heavy prejudice on account of their origin."
