FROM mcr.microsoft.com/dotnet/core/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 5000

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /src
COPY ["aspnetcoreapp.csproj", "./"]
RUN dotnet restore "aspnetcoreapp.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "aspnetcoreapp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "aspnetcoreapp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "aspnetcoreapp.dll"]


