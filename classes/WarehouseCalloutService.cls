public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    public class WarehouseEquipment
    {
        String id;
        Boolean replacement;
        Integer quantity;
        String name;
        Integer cost;
        String sku;
        Integer lifespan;
        Integer maintenanceperiod;
    }
    @future(callout=true)
    public static void runWarehouseEquipmentSync() 
    {
        //ToDo: complete this method to make the callout (using @future) to the
        //      REST endpoint and update equipment on hand.

        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(WAREHOUSE_URL);
        req.setMethod('GET');
        HttpResponse resp = h.send(req);
        System.debug('Equipment Response ' + resp.getBody());
        updateEquipment(convert(resp.getBody()));           
    }
    private static List<WarehouseEquipment> convert(String responseJson)
    {
        List<WarehouseEquipment> equipmentList = (List<WarehouseEquipment>)JSON.deserialize(responseJson, List<WarehouseEquipment>.class);
        System.debug('Equipment List ' + equipmentList);
        return equipmentList;
    }
    private static void updateEquipment(List<WarehouseEquipment> we)
    {
        List<Product2> equipments = new List<Product2>();
        for(WarehouseEquipment e: we)
        {
            Product2 equipment = new Product2();
              equipment.Warehouse_SKU__c = e.sku;
              equipment.Name = e.name;
              equipment.Replacement_Part__c = true;
              equipment.Lifespan_Months__c = e.lifespan;
              equipment.Cost__c = e.cost;
              equipment.Maintenance_Cycle__c = e.maintenanceperiod;
              equipment.Current_Inventory__c = e.quantity;
              equipments.add(equipment);      
        }
        System.debug('Product List ' + equipments);
       upsert equipments Warehouse_SKU__c;
    }
    
   
}