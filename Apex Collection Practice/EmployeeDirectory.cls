public class EmployeeDirectory {

    // Method to update and sort the employee list with a single input
    public static List<String> updateListWithDuplicatesRemoved(List<String> temp) {
        // Remove duplicates using a Set
        Set<String> setList = new Set<String>(temp);

        // Convert back to a List and sort
        List<String> sortedList = new List<String>(setList);
        sortedList.sort();

        return sortedList;
    }

    // Method to combine two lists, remove duplicates, and sort
    public static List<String> updateListWithNewNames(List<String> oldList, List<String> newList) {
        // Combine old and new lists into a Set to remove duplicates
        Set<String> combinedSet = new Set<String>(oldList);
        combinedSet.addAll(newList);

        // Convert to a sorted List
        List<String> sortedList = new List<String>(combinedSet);
        sortedList.sort();

        return sortedList;
    }
}
