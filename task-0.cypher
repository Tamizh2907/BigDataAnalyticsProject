// Task 0

// Server: http://csc8101-neo4j-task0.uksouth.cloudapp.azure.com:7474/browser/
// Neo4j Connect URL: bolt://20.90.107.47:7687
// Neo4j username: neo4j
// Neo4j password: neo4j

//Count self-edges
MATCH (z1:zone)-[rel :CONNECTS]->(z2:zone) WHERE z1.id=z2.id RETURN count(rel)

//Find self-edges
// see as Text not as Graph (as the whole graph is shown)
MATCH (z1:zone)-[rel :CONNECTS]->(z2:zone) WHERE z1.id=z2.id RETURN z1,rel,z2 // LIMIT 10 // to see as graph

//Find isolated nodes
MATCH (z:zone)
WHERE NOT (z)—[:CONNECTS]-(:zone)
RETURN z