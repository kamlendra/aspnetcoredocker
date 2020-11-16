FROM      mcr.microsoft.com/dotnet/core/sdk

LABEL     author="Kamlendra Sharma"

ENV ASPNETCORE_URLS=http://*:5000
ENV DOTNET_USE_PoLLING_FILE_WATCHER=1
ENV ASPNETCORE_ENVIRONMENT=development

WORKDIR /app

ENTRYPOINT [ "/bin/bash", "-c", "dotnet restore and dotnet watch run" ]

