

#Install dotnet
sudo apt-get install -y dotnet-sdk-2.1

#Create hello world console project
dotnet new console -o testDotNet
cd testDotNet

#Compile and run project
dotnet run

#Execute dll
dotnet bin/Debug/netcoreapp3.1/testDotNet.dll


