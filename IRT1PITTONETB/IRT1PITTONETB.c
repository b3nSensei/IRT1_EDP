//Prototype des fonctions
void ledParLed() ;
void cycle() ;
void permanent() ;
//Main programme
void main()
{
    TRISA = 0b00000011 ;
    PORTA = 0 ;
    TRISB = 0b00000000;
    PORTB = 0 ;
    pcon.OSCF = 1;
    CMCON = 0b00000111;

    while(1)
    {
        delay_ms(400);
        if (RA0_bit==0)
        {
            PORTB=1;
            RA3_bit=0;
            delay_ms(400);
            if(RA0_bit==0)
            {
                RA6_bit=0;
                delay_ms(400);
                if(RA0_bit==0)
                {
                    RA7_bit=0;
                    delay_ms(400);
                    permanent(void);
                    delay_ms(400);
                }
                cycle(void);
                delay_ms(400);
            }
            ledParLed(void);
            delay_ms(400);
        }
        RA3_bit=1;
        RA6_bit=1;
        RA7_bit=1;
    }
}
//Sous programme Mode 1
void ledParLed(void)
{
    while (PORTB>0)
    {
        if (RA0_bit==0 && PORTB<128) PORTB*=2; delay_ms(270);
        if (RA0_bit==0 && PORTB==128) PORTB=0;
    }
}
//Sous programme Mode 2
void cycle(void)
{
    while (PORTB>0)
    {
        delay_ms(250);
        PORTB*=2;
        if (PORTB>128)
        {
            PORTB=1;
        }
        if (RA0_bit==0)
        {
            PORTB=PORTB;
            delay_ms(250);
            while (RA0_bit==1)
            {
                PORTB=PORTB;
            }
            delay_ms(400);
            if (RA0_bit==0)
            {
                PORTB=0;
            }
        }
    }
}
//Sous programme Mode 3
void permanent(void)
{
    while (PORTB>0)
    {
        delay_ms(1);
        PORTB*=2;
        if (PORTB>128)
        {
            PORTB=1;
        }
        if (RA0_bit==0)
        {
            PORTB=0;
        }
    }
}
