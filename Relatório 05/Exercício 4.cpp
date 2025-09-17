#include<iostream>

using namespace std;

double CF(double c){
	
	return ((c * 1.8) + 32);
}

double CK(double c){
	return (c + 273);
}

int main(){
	double c;
	int op;
	
	do{
		
		cin >> op;
		switch(op){
			
			case 1:
				cin >> c;
				cout << "Temperatura em Fahrenheit: "<< CF(c)<< endl;
				break;
  		    case 2:
  		    	cin >> c;
  		    	cout << "Temperatura em Kelivin: " << CK(c)<< endl;
  		    	break;
	    	default:
	    		break;
		}
		
	}while(op != 3);
	
	
	return 0 ;
}
