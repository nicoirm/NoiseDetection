// calculates the average of a data block (block of data that 1 microphone delivers to the main unit to be analyzed).

#include <iostream>
#include <stdlib.h>
#include <fstream>
using namespace std;


int main (int argc, char *argv[]){
if(argc < 2) {cout<<endl<<" Missing data. "<<endl<<endl; return 1;}

ifstream infile(argv[1]);

int tmp0;
int sum = 0; 
int n = 0; 

// calculates while reading the data (should be the fast way)
infile>>tmp0;
while(!infile.eof())
{
// cout<<" "<<tmp0; 
sum+=tmp0; 
n++; 
infile>>tmp0;
}
infile.close();

// cout<<" sum = "<<sum<<endl;
// cout<<" number of datapoints = "<<n<<endl;
// cout<<" average = "<<(double)((double)(sum)/(double)(n))<<endl;
cout<<(double)((double)(sum)/(double)(n))<<endl;

return 0;}
