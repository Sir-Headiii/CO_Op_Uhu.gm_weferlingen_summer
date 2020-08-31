/*
*   Legt Gruppennamen, Standard- und Sonderkanäle fest.
*   Gruppenspezifische Kanäle können über die Einträge channel1-channel8 für Shortrange und channel1-channel9 für Longrange festgelegt werden.
*   Hier werden die in der radiosettings.hpp definierten Kanalnamen oder Klassennamen der Kanäle verwendet.
*
*   Beispiel:
*
    class BLUFOR {
        class group1 {
            groupName = "Command";

            class shortrange {
                defaultChannel = 1;
                altChannel = 3;
                altChannelOnlyTL = 1;

                channel1 = "Command Kanal";
                channel3 = "net13";
                channel7 = "Command Intern";
            };

            class longrange {
                defaultChannel = 2;
                altChannel = 5;
                altChannelOnlyTL = 1;

                channel2 = "Air";
                channel5 = "net10";
            };
        };
    };
*
*/

class BLUFOR {
    class Uhu {
        class shortrange {
                    defaultChannel = 1;
                    altChannel = 0;
                    altChannelOnlyTL = 0;

                    channel1 = "Kauz";
                    channel2 = "Nachtigall";
                    channel3 = "Eule";
        };
        class longrange {
                defaultChannel = 1;
                altChannel = 0;
                altChannelOnlyTL = 0;

                channel1 = "Zugführung";
                channel2 = "Dachs";
        };
    }
    class Kauz_1 {
        class shortrange {
                    defaultChannel = 1;
                    altChannel = 0;
                    altChannelOnlyTL = 0;

                    channel1 = "Kauz";
                    channel2 = "Nachtigall";
                    channel3 = "Eule";
        };
        class longrange {
                defaultChannel = 1;
                altChannel = 0;
                altChannelOnlyTL = 0;

                channel1 = "Zugführung";
                channel2 = "Dachs";
        };
    }
    class Kauz_2 {
        class shortrange {
                    defaultChannel = 1;
                    altChannel = 0;
                    altChannelOnlyTL = 0;

                    channel1 = "Kauz";
                    channel2 = "Nachtigall";
                    channel3 = "Eule";
        };
        class longrange {
                defaultChannel = 1;
                altChannel = 0;
                altChannelOnlyTL = 0;

                channel1 = "Zugführung";
                channel2 = "Dachs";
        };
    }
    class Eule_1 {
        class shortrange {
                    defaultChannel = 1;
                    altChannel = 0;
                    altChannelOnlyTL = 0;

                    channel1 = "Kauz";
                    channel2 = "Nachtigall";
                    channel3 = "Eule";
        };
        class longrange {
                defaultChannel = 1;
                altChannel = 0;
                altChannelOnlyTL = 0;

                channel1 = "Zugführung";
                channel2 = "Dachs";
        };
    }
    class Eule_2 {
        class shortrange {
                    defaultChannel = 1;
                    altChannel = 0;
                    altChannelOnlyTL = 0;

                    channel1 = "Kauz";
                    channel2 = "Nachtigall";
                    channel3 = "Eule";
        };
        class longrange {
                defaultChannel = 1;
                altChannel = 0;
                altChannelOnlyTL = 0;

                channel1 = "Zugführung";
                channel2 = "Dachs";
        };
    }
    class Dachs {
        class shortrange {
                    defaultChannel = 1;
                    altChannel = 0;
                    altChannelOnlyTL = 0;

                    channel1 = "Kauz";
                    channel2 = "Nachtigall";
                    channel3 = "Eule";
        };
        class longrange {
                defaultChannel = 1;
                altChannel = 0;
                altChannelOnlyTL = 0;

                channel1 = "Zugführung";
                channel2 = "Dachs";
        };
    }
    class Nachtigall {
        class shortrange {
                    defaultChannel = 1;
                    altChannel = 0;
                    altChannelOnlyTL = 0;

                    channel1 = "Kauz";
                    channel2 = "Nachtigall";
                    channel3 = "Eule";
        };
        class longrange {
                defaultChannel = 1;
                altChannel = 0;
                altChannelOnlyTL = 0;

                channel1 = "Zugführung";
                channel2 = "Dachs";
        };
    }
};

class OPFOR {

};

class INDEPENDENT {

};
