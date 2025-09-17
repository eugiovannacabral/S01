#include<iostream>

using namespace std;

float somarArray(float arr[], int t)
{
	int soma = 0;
	for(int i = 0; i < t; i++){
		
		soma += arr[i];
	}
	return(soma);
}


int main(){
	
	int t;
	float arr[100];
	
	cin >> t;
	
	for(int i = 0; i < t; i++){
		
		cin >> arr[i];
	}
	
	cout << "Soma: " << somarArray(arr,t);
	
	return 0;
}
