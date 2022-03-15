// Task 1

// Server: http://csc8101-neo4j-task1.uksouth.cloudapp.azure.com:7474/browser/
// Neo4j Connect URL: bolt://20.90.189.157:7687
// Neo4j username: neo4j
// Neo4j password: neo4j

// TODO - change USERNAME to your student number

//Project graph
CALL gds.graph.create(
    'USERNAME-louvain',
    'zone',
    {
        CONNECTS: {
            orientation: 'UNDIRECTED'
        }
    },
    {
        relationshipProperties: 'trips'
    }
)

//Run stats mode
CALL gds.louvain.stats('USERNAME-louvain', {relationshipWeightProperty: 'trips'})
YIELD communityCount

//Run stream mode
CALL gds.louvain.stream('USERNAME-louvain', {relationshipWeightProperty: 'trips'})
YIELD nodeId, communityId
RETURN gds.util.asNode(nodeId).id AS zone, communityId as community
ORDER BY zone ASC

// export csv file in stream mode to see visualisation in
// http://csc8101-neo4j-shiny.uksouth.cloudapp.azure.com/