abstract class BaseService {

  Future<dynamic> getEntries();

  Future<dynamic> updateEntry(String tableName,int id,Map<String,dynamic> data);

  Future<dynamic> addEntry(String tableName,Map<String,dynamic> data);

  Future<dynamic> deleteEntry(String tableName,int id);

}