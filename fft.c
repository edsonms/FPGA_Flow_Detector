#include <stdio.h>
#include <math.h>
#define  N 256
#define  NM1 (N-1)
#define  ND2 (N/2)
#define  M 8 // M = log(N)/log(2)
#define pi 3.14159265


int main()
{
        FILE *fp = fopen("SAMPLE_Corrigida.CSV","r");

        float re[N]={0};
        float im[N]={0};
        double temp;

        for(int i=0;i<N;i++)
        {
                fscanf(fp,"%lf",&temp);
                re[i]=temp;
        }
        fclose(fp);

        int j = ND2;
        int k;
        float TR;
        float TI;
        for (int i=1; i <= N-2; i++)
        {
                if (i >= j) goto jump;
                else
                {
                        TR = re[j];
                        TI = im[j];
                        re[j]=re[i];
                        im[j]=im[i];
                        re[i]=TR;
                        im[i]=TI;
                }
jump:
                k=ND2;
jump2:
                if (k > j) goto jump3;
                else
                {
                        j = j - k;
                        k=k/2;
                        goto jump2;
                }
jump3:
                j=j+k;
        }

        /*for (int i = 0; i < N; i += 1)
        {
                printf( "%f", re[i]);
                printf( ",%f\n", im[i]);
        }*/
        //printf("\n");

        for (int L = 1; L <= M; L++)
        {
                int LE = pow(2,L);
                int LE2 = LE/2;
                float UR = 1;
                float UI = 0;
                float SR = cos(pi/LE2);
                float SI = -sin(pi/LE2);
                int teste;

                for (int j = 1; j <= LE2; j++)
                {
                        int jm1 = j-1;
                        for (int i = jm1; i <= NM1; i=i+LE)
                        {
                                int ip = i + LE2;
                                if(i==1 || ip==1)
                                        teste=0;
                                TR = re[ip]*UR - im[ip]*UI;
                                TI = re[ip]*UI + im[ip]*UR;
                                re[ip]=re[i]-TR;
                                im[ip]=im[i]-TI;
                                re[i]=re[i]+TR;
                                im[i]=im[i]+TI;

                        }
                        TR=UR;
                        UR=TR*SR - UI*SI;
                        UI=TR*SI + UI*SR;
                }
        }

        for (int i = 0; i < N; i += 1)
        {
                printf( "%f", (re[i]/32767)*611*64);
                printf( ",%f\n", (im[i]*611*64));
        }
}
