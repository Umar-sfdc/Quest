/**
* @File Name : CityPopulations.cls
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

public class CityPopulations {
	

	// initialzied cityPopu to null.
	public static Map<String,Integer> cityPopu = new Map<String, Integer>();

	public static void addCity(String city, Integer popu)
	{
		if(city != null && popu != null)
			cityPopu.put(city, popu);
	}

	// retrive the population
	public static Integer retrivePopu(String city)
	{
		if(city != null && cityPopu.Containskey(city))
			return cityPopu.get(city);
		else
			return null;
	}

	// to delete an outdated city entry

	public static Boolean removeCity(String city)
	{
		if(city != null && cityPopu.Containskey(city))
		{
			cityPopu.remove(city);
			return TRUE;
		}
		else
		{
			System.debug('City not found for deletion: '+city);
			return FALSE;
		}
	}

	// to print the city populations
	public static void printDetails()
	{
		System.debug('City Population MAP : '+cityPopu);
	}


}
