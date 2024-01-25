global class CreateOpp {

	global class Opp {
		webservice String name;
		webservice String stage;
		webservice Date oppdate;
		webservice Id oppId;
	}

	webservice static Opp oppCreate(Opp o)
	{
        Opportunity opp = new Opportunity();
		opp.Name = o.name;
		opp.StageName = o.stage;
		insert opp;

		o.oppId = opp.Id;
		return o;


	}
}