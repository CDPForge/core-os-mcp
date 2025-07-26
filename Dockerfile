# Dockerfile
FROM python:3.10-slim

# Installa git e pip dependencies
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clona e installa il pacchetto MCP server
RUN git clone https://github.com/opensearch-project/opensearch-mcp-server-py.git /app
WORKDIR /app
RUN pip install .

# Porta predefinita per SSE
EXPOSE 9900

# Avvia il server MCP in modalità SSE
CMD ["python", "-m", "mcp_server_opensearch", "--transport", "stream"]
