/**
* @File Name : InventoryTracker.cls
* @Description :
* @Author :
* @Last Modified By :
* @Last Modified On : January 16, 2025
* @Modification Log :
*==============================================================================
* Ver | Date | Author | Modification
*==============================================================================
* 1.0 | January 16, 2025 |   | Initial Version
**/

public class InventoryTracker {
	
	private static Set<ID> productIds = new Set<ID>();		// initialized to null.


	// to add single id.
	public static void addSingleId(ID singleId)
	{
		if(singleId != null)
			productIds.add(singleId);
	}

	// add id's from list.
	public static void addFromList(List<ID> listId)
	{
		if(listId != null && !listId.isEmpty())
			productIds.addAll(new Set<ID>(listId));			// anonymous set / set without name
	}

	// add id's from set.
	public static void addFromSet(Set<ID> setId)
	{
		if(setId != null && !setId.isEmpty())
			productIds.addAll(setId);
	}

	// verify single id.
	public static Boolean verifyProductId(ID singleId)
	{
		if(singleId != null)
			return productIds.Contains(singleId);
		return FALSE;
	}

	// verify from list.
	public static Boolean verifyProductId(List<ID> listId)
	{
		if(listId != null && !listId.isEmpty())
			return productIds.ContainsAll(new Set<ID>(listId));
		else
			return FALSE;
	}


	// display products id's
	public static void printDetails()
	{	
		System.debug('Products IDs : '+productIds);
	}



}