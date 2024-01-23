**igraph basics** 

**python:**

1. **Importing the Library**

Once installed, you can import the library into your Python script:

import igraph as ig![](Aspose.Words.d0aad397-7f83-475d-b7b6-5d3b051f706f.001.png)

2. **Creating a Graph**

There are several ways to create a graph. Here's how you can create an empty graph and then add vertices (nodes) and edges:

- Create an empty graph g = ig.Graph()![ref1]
- Add vertices

  g.add\_vertices(3)  # This adds three vertices to the graph

- Add edges

g.add\_edges([(0, 1), (1, 2)])  # This adds two edges: one bet ween vertex 0 and 1, and another between vertex 1 and 2

3. **Graph Attributes**

You can add attributes to the graph, vertices, and edges. This can be useful for storing additional information:

- Set graph attribute g["name"] = "My Graph"![](Aspose.Words.d0aad397-7f83-475d-b7b6-5d3b051f706f.003.png)
- Set vertex attributes

  g.vs["label"] = ["A", "B", "C"]  # Each vertex now has a labe

l ('A', 'B', 'C')![](Aspose.Words.d0aad397-7f83-475d-b7b6-5d3b051f706f.004.png)

- Set edge attributes

g.es["weight"] = [1, 2]  # Each edge now has a weight (1 and 2 respectively)

4. **Analyzing the Graph**

**igraph** offers various functions to analyze graphs:![](Aspose.Words.d0aad397-7f83-475d-b7b6-5d3b051f706f.005.png)

- Get the degree of each vertex print(g.degree())![ref1]
- Shortest paths

  print(g.shortest\_paths(0, 2))  # Shortest path from vertex 0 to vertex 2

- Betweenness centrality print(g.betweenness())
5. **Visualizing the Graph**

You can visualize the graph using  **igraph** 's plotting capabilities:

import igraph as ig![](Aspose.Words.d0aad397-7f83-475d-b7b6-5d3b051f706f.006.png)

import matplotlib.pyplot as plt

g = ig.Graph([(0, 1), (1, 2), (2, 0)]) ig.plot(g)

Note: For visualization, you might need additional dependencies like  **pycairo** or  **python- ![](Aspose.Words.d0aad397-7f83-475d-b7b6-5d3b051f706f.007.png)cairo** depending on your system.![](Aspose.Words.d0aad397-7f83-475d-b7b6-5d3b051f706f.008.png)

6. **Working with Larger Graphs**

For larger graphs, you would typically read data from a file or another source:

- Reading from a CSV (as an example) import pandas as pd![](Aspose.Words.d0aad397-7f83-475d-b7b6-5d3b051f706f.009.png)

  data = pd.read\_csv("edges.csv")  # Assuming you have a CSV fi le with edge pairs

g = ig.Graph.TupleList(data.itertuples(index=False), directed =False)
igraph basics 3

[ref1]: Aspose.Words.d0aad397-7f83-475d-b7b6-5d3b051f706f.002.png
