import 'package:car_model/db/cached_company.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';


class LocalDatabase{
  static final LocalDatabase getInstance=LocalDatabase._init();

  static Database?_database;

  factory LocalDatabase(){
    return getInstance;
  }

  Future<Database> get database async{
    if(_database!=null){
      return _database!;
    }else {
      _database =await _initDB("");
      return _database!;
    }
  }
  Future<Database> _initDB(String filePath) async{
    final dbPath= await getDatabasesPath();
    final path= join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }
  Future _createDB(Database db, int version) async{
    const idType="INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType="TEXT NOT NULL";
    const intType="INTEGER DEFAULT 0";
    const boolType="BOOLEAN NOT NULL";

    await db.execute('''
    CREATE TABLE $tableName3(
    ${CachedCompanyFields.id} $idType,
    ${CachedCompanyFields.logo} $textType,
    ${CachedCompanyFields.averagePrice} $textType,
    ${CachedCompanyFields.carModel} $textType,
    ${CachedCompanyFields.establishedYear} $intType,
    ${CachedCompanyFields.isFavorite} $boolType
    )
    ''');
    await db.close();
  }

  LocalDatabase._init();
//----------------------------------Cached Company Table------------------

  // Kiritish
  static Future<CachedCompany> insertCachedCompany(CachedCompany cachedCompany)async{
    final db= await getInstance.database;
    final id =await db.insert(tableName3, cachedCompany.toJson());
    return cachedCompany.copyWith(id: id);
  }
// Hamma datani olish
  static Future<List<CachedCompany>> getAllCachedCompanies()async{
    final db= await getInstance.database;
    const orderBy= CachedCompanyFields.carModel;
    final result =await db.query(tableName3, orderBy: orderBy);
    return result.map((json) => CachedCompany.fromJson(json)).toList();
  }
// Hammasini o'chirish
  static Future<int> deleteAllCachedCompanies(CachedCompany cachedCompany) async {
    final db = await getInstance.database;
    return await db.delete(tableName3);
  }
  // Id bo'yich o'chirish
  static Future<int> deleteCachedCompanyById(int id) async {
    final db = await getInstance.database;
    var t = await db
        .delete(tableName3, where: "${CachedCompanyFields.id}=?", whereArgs: [id]);
    if (t > 0) {
      return t;
    } else {
      return -1;
    }
  }

  // Yangilash
  static Future<int> updateCachedUser(CachedCompany cachedCompany) async {
    Map<String, dynamic> row = {
      CachedCompanyFields.carModel: cachedCompany.carModel,
      CachedCompanyFields.establishedYear: cachedCompany.establishedYear,
    };

    final db = await getInstance.database;
    return await db.update(
      tableName3,
      row,
      where: '${CachedCompanyFields.id} = ?',
      whereArgs: [cachedCompany.id],
    );
  }


}