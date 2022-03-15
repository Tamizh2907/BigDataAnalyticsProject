// Task 2

// Server: http://csc8101-neo4j-task1.uksouth.cloudapp.azure.com:7474/browser/
// Neo4j Connect URL: bolt://20.90.189.157:7687
// Neo4j username: neo4j
// Neo4j password: neo4j

// TODO - change USERNAME to your student number

//Projection
CALL gds.graph.create(
  'USERNAME-pagerank',
  'zone',
  'CONNECTS',
  {
    relationshipProperties: 'trips'
  }
)

//Stats
CALL gds.pageRank.stats('USERNAME-pagerank', {
  dampingFactor: 0.75,
  relationshipWeightProperty: 'trips'
})
YIELD centralityDistribution
RETURN centralityDistribution.max AS max

//Stream
CALL gds.pageRank.stream('USERNAME-pagerank', {
  dampingFactor: 0.75,
  relationshipWeightProperty: 'trips'
})
YIELD nodeId, score
RETURN gds.util.asNode(nodeId).id AS zone_id, score
ORDER BY zone_id ASC

// export csv file in stream mode to see visualisation in
// http://csc8101-neo4j-shiny.uksouth.cloudapp.azure.com/