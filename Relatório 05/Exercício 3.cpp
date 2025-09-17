#include<iostream>

using namespace std;


int main(){
	
	int n;
	int soma = 0;
	int cont = 0;
	int media;
	int notas[100];
	
	cin >> n;
	
	for(int i = 0; i < n; i++){
		
		cin >> notas[i];
		
		while( notas[i] < 0|| notas[i] > 10){
			cin >> notas[i];
		}
		
		soma += notas[i];
		cont ++;
	}
	
	media = soma/cont;	
	
	if( media >= 7){
		cout << "Aprovado!" << endl;
		
	}else{
		cout << "Reprovado!"<< endl;
	}
	
	return 0;
}
