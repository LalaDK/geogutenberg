class ForceCreateNeo4jCityUuidConstraint < Neo4j::Migrations::Base
  def up
    add_constraint :"Neo4j::City", :uuid, force: true
  end

  def down
    drop_constraint :"Neo4j::City", :uuid
  end
end
