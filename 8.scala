import scala.io.StdIn
import scala.collection.mutable.ArrayBuffer

object MinMax {

  def main (args: Array[String] ): Unit = {
    var numArray = new ArrayBuffer[Int]()
    print("Enter number of elements: ")
    val n = scala.io.StdIn.readInt()//Read the number of items in Array
    println("Enter elements below, one per line.")
    for (i <- 0 until n)//Read the array elements
      numArray += scala.io.StdIn.readInt()

    // println(numArray)//Display the array elements
	
    val t = minmax(numArray)// Returned value will be tuple
    printf("Minimum number is %d\n", t._1)//Display the maximum
    printf("Maximum number is %d\n", t._2)//Display the minimum
  }
	
  def minmax(numArray:ArrayBuffer[Int]): (Int,Int) = {

    var mi:Int = numArray(0)//Initialize minumum and maximum
    var mx:Int = numArray(0)
    for ( i <- numArray)
    {
      if (i < mi)
	mi = i
      else if (i > mx)
	mx = i
    }
    (mi,mx)//Return mx and mn as items of tuple
  }
}
		

