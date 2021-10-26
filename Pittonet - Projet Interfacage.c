//*********************************************
//Prototypes
void m1() ; //Mode 1: Allumage Led par Led
void m2() ; //Mode 2: Cycle avec option de pause
void m3() ; //Mode 3: Allumage constant
//*********************************************
//Debut de programme main:
/*Notre programme Main servira principalement à boucler dans un "menu" qui enclenchera
un mode de fonctionnement dependant de la pression effectuer sur le boutton*/
void main()
{
    TRISA = 0b00000011 ;    //port A en sortie sauf  RA0 et RA1
    PORTA = 0 ;             //mettre les sorties à zéro
    TRISB = 0b00000000;     //Port B en sortie
    PORTB = 0 ;             //mettre les sorties à zéro
    pcon.OSCF = 1;          //configure le bit 3 du registre pcon  pour 4 mhz
    CMCON = 0b00000111;     //désactiver les comparateurs sur RA0

    while(1)                                // Boucle infinie
    {                                       //Debut de while
        if (RA0_bit==0)                     //Si le bouton est enfoncer
        {                                   //Debut du IF
            RA3_bit=0;                      //On etaint les trois Led de mode
            delay_ms(500);                  //On attend pour verifier le delai de pression
            PORTB=1;                        //On définie la led de depart à la premiere led
            if (RA0_bit==1 && PORTB==1)     //Si le bouton n'est plus enfoncer on rentre en mode 1
            {
                delay_ms(400);				
                m1(void);                   //On execute notre sous programme m1 qui est le mode Led par Led
                delay_ms(400);              //On attend une demi seconde avant de terminer et revenir dans la boucle infinie
            }                               //Fin de IF
            RA3_bit=1;
            RA6_bit=0;
            delay_ms(500);                  //On attend pour verifier le boutton avant de demmarer le mode 2
            if (RA0_bit==1 && PORTB==1)     //Si Le bouton est relever, On rentre dans le mode 2
            {                               //Debut du IF
                delay_ms(400);
                m2(void);                   //On execute le mode 2: Allumage en cycle avec pause
                delay_ms(400);              //On attend avant de terminer et revenir dans la boucle infinie
            }								//Fin de IF
            RA6_bit=1;
            RA7_bit=0;						
            delay_ms(500);
            if (RA0_bit==1 && PORTB==1)     //Si le boutton est toujours enfoncer, alors on execute le contenue du IF
            {                               //Debut du IF
                delay_ms(400);
                m3(void);                   //On execute le sous programme Allumage constant
                delay_ms(400);              //Apres un delay on reviens dans la boucle infinie
            }                               //Fin de IF
        }                                   //Fin de IF
        PORTB=0;                            //On remet le portb à 0
        RA3_bit=1;
        RA6_bit=1;
        RA7_bit=1;
    }                                           //Fin de while
}

//*********************************************
//sous-programme MODE1
/*Ce sous programme permettra d'allumer la premiere led et attendra une pression du bouton pour
allumer la led suivante. Le mode requiert donc d'appuyer sur le bouton pour allumer la led suivante.
Si le bouton reste enfoncer, les led s'allumeront à la suite plus rapidement.
Une fois toutes les leds passer, notre sous programme nous renverra vers notre boucle infinie dans le
programme main. */
void m1(void)									//Debut du sous programme m1
{
    while (PORTB>0)								//Boucle: Tant que la valeur de portb est supérieur à 0, on execute le contenue de la boucle
    {											//Debut du while
        if (RA0_bit==0 && PORTB<128) PORTB*=2; delay_ms(270);
        //Si le bouton est enfoncer et qu'on est pas à la dérniére led, alors on passer à la led suivante et on l'allume
        if (RA0_bit==0 && PORTB==128) PORTB=0;
        //Si le bouton est enfoncer et qu'on est à la dérniere led, alors on met portb à 0
												//Ceci termine la boucle puisque portb esst à 0 notre while ne s'executera plus
    }											//Fin du while
}												//Fin du sous programme m1
//*********************************************
//sous-programme MODE2
/*Ce mode permettra d'allumer les led autoamtiquement à la suite l'unde de l'autre.
Il permettra aussi par appuys du bouton, de stopper la sequence sur la led en cours.
Un appuy long permettra de sortir du mode et de revenir dans notre main.*/
void m2(void)								//Debut du sous programme m2
{
    while (PORTB>0)							//Boucle: Tant que la valeur de portb est supérieur à 0, on execute le contenue de la boucle
    {                                       //Debut du while
        for(PORTB=PORTB;PORTB<128;PORTB*=2)
        //Boucle for: On prend la valeur de B comme valeur de debut et on la double à chaque itération tant qu'elle
        //n'est pas egal à la valeur de la dérniere led.
        {                                   //Debut du for
            delay_ms(250);					//On attend entre chaque Led
            if (RA0_bit==0)					//On verifie SI le bouton est enfoncer, on execute le contenue du SI
            {                               //Debut du IF
                delay_ms(250);				//On attend pour verifier le boutton
                if (RA0_bit==0)				//Si le bouton est toujours enfoncer
                {                           //Debut du IF
                    PORTB=0;				//On réinitialise le portb
                    break;					//On sort de notre sous programme vers notre main
                }                           //Fin du IF
                while (RA0_bit==1)			//Boucle: Tant que le bouton n'est pas de nouveau enfoncer
                {                           //Debut de while
                    PORTB=PORTB;			//On reste sur la led actuelle= pause
                }                           //Fin du while
            }                               //fin du IF
        }                                   //Fin du for
        delay_ms(300);						//On attend avant de tester à nouveau la valeur de portb
        if (PORTB>0) PORTB=1;				//SI la valeur de portb est supérieur à 0 alors on le remet à un pour recommencer la boucle
    }                                       //Fin du while
}											//Fin du sous programme m2
//*********************************************
//sous-programme MODE3
/*Ce mode allumera les led à grande vitesse de sorte que l'oeil humain les percevra comme toutes allumer constament.*/
void m3(void)                               //Debut du sous programme m3
{
    while (PORTB>0)							//Boucle: Tant que la valeur de portb est supérieur à 0, on execute le contenue de la boucle
    {                                       //Debut du while
        for(PORTB=PORTB;PORTB<128;PORTB*=2)
        //Boucle for: On prend la valeur de B comme valeur de debut et on la double à chaque itération tant qu'elle
        //n'est pas egal à la valeur de la dérniere led.
        {                                   //Debut du for
            delay_ms(1);					//On attend entre chaque Led
        }                                   //Fin du for
        delay_ms(1);						//On attend avant de tester à nouveau la valeur de portb
        if (PORTB>0) PORTB=1;				//SI la valeur de portb est supérieur à 0 alors on le remet à un pour recommencer la boucle
    }                                       //Fin du while
}
//*********************************************