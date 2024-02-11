# Load necessary libraries
library(Matrix)
library(igraph)
library(tidyr)
library(readr)

edges <- read.csv("D:/MSBA sem 2/network science/ass 1/fb-pages-tvshow/fb-pages-tvshow-edges.txt", header = FALSE, sep = ",") # adjust parameters as needed
nodes <- read.csv("D:/MSBA sem 2/network science/ass 1/fb-pages-tvshow/fb-pages-tvshow-nodes.txt", header = TRUE, sep = ",") # adjust parameters as needed

networkA <- graph_from_data_frame(d = edges, directed = FALSE) # Use directed = TRUE if your graph is directed

V(networkA)
#number of nodes 

E(networkA)
#number of edges 

networkA <- graph_from_data_frame(edges, directed = FALSE)

#print(networkA)
plot(networkA)

V(networkA)
#even number of nodes 

# determining the number of nodes to sample
k <- vcount(networkA)
sample_size <- ifelse(k %% 2 == 0, k / 2, (k + 1) / 2)

# Randomly sample nodes
set.seed(123) # For reproducibility
Vsample <- sample(vcount(networkA), size = sample_size)

#creating the subgraph
networkA_sample <- induced_subgraph(networkA, vids = Vsample)

plot(networkA_sample)

E(networkA_sample)
print_all(networkA_sample)

#finding graph density
density1 <- graph.density(networkA)
print(density1)

density2 <- graph.density(networkA_sample)
print(density2)

# Calculating the average path length 
avg_path_length1 <- average.path.length(networkA, directed = FALSE)
avg_path_length2 <- average.path.length(networkA_sample, directed = FALSE)

cat(avg_path_length1, "\n")
cat(avg_path_length2, "\n")

# Calculating the clustering coefficient 
clust_coeff1 <- transitivity(networkA, type = "average")
clust_coeff2 <- transitivity(networkA_sample, type = "average")

# Print the clustering coefficients
cat("Clustering Coefficient - Original Graph:", clust_coeff1, "\n")
cat("Clustering Coefficient - Induced Subgraph:", clust_coeff2, "\n")

#Q2

#additional 5 degree of measures 
degree_networkA <- degree(networkA)
closeness_networkA <- closeness(networkA)
clustering_coefficient_networkA <- transitivity(networkA, type = "average")
pagerank_networkA <- page_rank(networkA)$vector
eccentricity_networkA <- eccentricity(networkA)


# Combining all measures into a data frame
measures_df <- data.frame(
  degree_networkA,
  closeness_networkA,
  clustering_coefficient_networkA,
  pagerank_networkA,
  eccentricity_networkA
)


# Computing the correlation matrix
correlation_matrix <- cor(measures_df, method = "pearson")
print(correlation_matrix)


#Q3

n <- vcount(networkA)  # Number of nodes in Network A
m <- ecount(networkA)  # Number of edges in Network A

# Create a random graph with the same number of nodes and edges
network_random <- sample_gnm(n, m, directed = FALSE, loops = TRUE)

# Inspect the random graph
summary(network_random)

plot(network_random)

# Average Path Length
avg_path_length_random <- average.path.length(network_random)
print(avg_path_length_random)

# Global Clustering Coefficient
clustering_coeff_random <- transitivity(network_random, type = "average")
print(clustering_coeff_random)

# density
diameter_random <- graph.density(network_random)
print(diameter_random)

# 5 similar measures for the random graph 
degree_random <- degree(network_random)
print(degree_random)
closeness_random <- closeness(network_random)
print(closeness_random)
clustering_random <- transitivity(network_random, type = "local")
print(clustering_random)
pagerank_random <- page_rank(network_random)$vector
print(pagerank_random)
eccentricity_random <- eccentricity(network_random)
print(eccentricity_random)



#performing statistical test to compare significance with networkA

#cluster coefficient
# Perform Mann-Whitney U test
test_result <- wilcox.test(clustering_coefficient_networkA, clustering_random, alternative = "two.sided")

# Print the test results
print(test_result)

#performing statistical test to compare significance with networkA with 5 measures 
wilcox.test(degree_networkA, degree_random, alternative = "two.sided")
wilcox.test(closeness_networkA, closeness_random, alternative = "two.sided")
#wilcox.test(clustering_coefficient_networkA, clustering_random, alternative = "two.sided")
wilcox.test(pagerank_networkA, pagerank_random, alternative = "two.sided")
wilcox.test(eccentricity_networkA, eccentricity_random, alternative = "two.sided")



