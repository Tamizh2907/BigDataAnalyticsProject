// Task 3 - Get the top 3 highest centrality zones per community

// Server: http://csc8101-neo4j-task3.uksouth.cloudapp.azure.com:7474/browser/
// Neo4j Connect URL: bolt://20.117.94.144:7687
// Neo4j username: neo4j
// Neo4j password: neo4j

// with Manhattan
MATCH (n:zone)
WITH n
ORDER BY n.centrality DESC
WITH n.community as community, COLLECT(n.id)[..3] as top_three
UNWIND top_three AS zone_id
RETURN zone_id, community

// without Manhattan
MATCH (n:zone)-[:IN]->(b:borough)
WHERE b.name <> "Manhattan"
WITH n
ORDER BY n.centrality DESC
WITH n.community as community, COLLECT(n.id)[..3] as top_three
UNWIND top_three as zone_id
RETURN zone_id, community

// export csv file in stream mode to see visualisation in
// http://csc8101-neo4j-shiny.uksouth.cloudapp.azure.com/