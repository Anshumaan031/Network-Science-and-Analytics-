library(igraph)
library(readxl)
library(network)
library(statnet)
library(ergm)

# Load the dataset
df <- read.csv2("D:/MSBA sem 2/network science/group assignment/data.csv",sep = ",")

# Create a directed graph
G <- graph.empty(directed = TRUE)

print(colnames(df))


# Add stations as vertices
stations <- unique(c(df$`Start.station.number`, df$`End.station.number`))
G <- add_vertices(G, nv = length(stations), name = stations)


# Initialize an empty list for edge weights
edge_weights <- list()

# Add edges with weights
for (i in 1:nrow(df)) {
  start_station <- as.character(df[i, 'Start.station.number'])
  end_station <- as.character(df[i, 'End.station.number'])
  edge_key <- paste(start_station, end_station, sep = "-")
  
  if (edge_key %in% names(edge_weights)) {
    # Increment weight if the edge already exists
    edge_weights[[edge_key]] <- edge_weights[[edge_key]] + 1
  } else {
    # Add a new edge with weight 1
    edge_weights[[edge_key]] <- 1
    names(edge_weights)[length(names(edge_weights))] <- edge_key
  }
}


# Add edges with their weights to the graph
for (edge_key in names(edge_weights)) {
  stations_split <- strsplit(edge_key, "-")[[1]]
  G <- add_edges(G, c(stations_split[1], stations_split[2]), attr = list(weight = edge_weights[[edge_key]]))
}

# Optional: Plot the graph
# plot(G)

# Print the number of nodes and edges
num_nodes <- gorder(G)
cat("Number of nodes in Network_A:", num_nodes, "\n")

num_edges <- gsize(G)
cat("Number of edges in Network_A:", num_edges, "\n")

# Assuming your igraph object is named G
G_net <- as.network(G, directed = TRUE)

plot(G, layout = layout_nicely(G))


