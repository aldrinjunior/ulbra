package com.example.pobrecomdinheiro.database
import android.app.Application
import android.content.Context
import androidx.lifecycle.AndroidViewModel
import androidx.room.*
import androidx.room.Room

@Entity(indices = [Index("name"), Index("criptocode")])
data class CriptoBuy(
        @PrimaryKey(autoGenerate = true) val id: Int? = null,
        val cripto: String,
        val name: String,
        val price: Double,
        val quantity: Double)

@Dao
interface CryptoDAO{

    @Insert
    suspend fun buyCripto(cryptoBuy: CriptoBuy)

    @Update
    suspend fun updateCripto(cryptoBuy: CriptoBuy)

    @Query ("DELETE FROM CriptoBuy WHERE cripto == :cripto")
    suspend fun deleteCriptoBuy(cripto: String)

    @Query("SELECT * FROM  CriptoBuy WHERE cripto == :cripto")
    suspend fun getCriptoBuys(cripto: String): List<CriptoBuy>

}
@Database(entities = [CriptoBuy::class], version = 1, exportSchema = false)
abstract class AppDatabase: RoomDatabase(){
    abstract fun criptoDao() : CryptoDAO

    companion object {
        @Volatile
        private var instance: AppDatabase? = null
        //private val LOCK = Any()

        fun getDatabase(context: Context): AppDatabase {
            return instance ?: synchronized(this) {
                instance
                        ?: buildDatabase(context).also{ instance = it}
            }
        }

        private fun buildDatabase(context: Context): AppDatabase{
            return Room.databaseBuilder(context, AppDatabase::class.java, "CriptoDB").build()
        }
    }
}

