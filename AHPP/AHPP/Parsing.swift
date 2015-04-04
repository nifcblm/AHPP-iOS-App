//
//  Parsing.swift
//  AHPP
//
//  Created by Ben Neely on 3/15/15.
//  Copyright (c) 2015 boisestate. All rights reserved.
//

import Foundation


func parse(path: NSURL) -> Bool {
    var i = 0
    var table_gen = LookupTableGenerator(path: path)
    var table: Array2D
    

    ViewController.saveLookUpTable("AAAAA")


    table = table_gen.nextTable()
    println("col:\(table.colCount()) rows\(table.rowCount())")
    
    for col in 0..<table.colCount()
    {
        for row in 0..<table.rowCount()
        {
            if(row == 0 && col == 0)
            {
                print("cnr ")
            }
            else if(table[col,row] != nil && table[col,row]>=0)
            {
                print("\(table[col,row]!) ")
            } else if(table[col,row] == nil)
            {
                print("nil ")
            }
        }
        println()
    }
    
    table = table_gen.nextTable()
    println("col:\(table.colCount()) rows\(table.rowCount())")
    
    for col in 0..<table.colCount()
    {
        for row in 0..<table.rowCount()
        {
            if(row == 0 && col == 0)
            {
                print("cnr ")
            }
            else if(table[col,row] != nil && table[col,row]>=0)
            {
                print("\(table[col,row]!) ")
            } else if(table[col,row] == nil)
            {
                print("nil ")
            }
        }
        println()
    }
    
    table = table_gen.nextTable()
    println("col:\(table.colCount()) rows\(table.rowCount())")
    
    for col in 0..<table.colCount()
    {
        for row in 0..<table.rowCount()
        {
            if(row == 0 && col == 0)
            {
                print("cnr ")
            }
            else if(table[col,row] != nil && table[col,row]>=0)
            {
                print("\(table[col,row]!) ")
            } else if(table[col,row] == nil)
            {
                print("nil ")
            }
        }
        println()
    }
    return true
}

class LookupTableGenerator
{
    var table_num: Int = 0
    var path: NSURL
    var atTable: Bool = false
    var aStreamReader: StreamReader
    init(path: NSURL)
    {
        self.path = path
        self.aStreamReader = StreamReader(path: self.path.path!)!
        println("created table generator and StreamReader")
    }
    
    func nextTable() -> Array2D
    {
        var line: String
        var table: Array2D = Array2D(cols: 0, rows: 0)
        var dim: [Int]
        if(findTable())
        {
            self.table_num++
            dim = getTableDimensions()
            table = Array2D(cols: dim[0], rows: dim[1])
            for i in 0..<table.colCount()
            {
                let parsedline = getNextLine()
                for (j, cell) in enumerate(parsedline)
                {
                    table[i,j] = cell
                }
            }
            self.atTable = false
        }
        
        return table
    }
    
    private func findTable() -> Bool
    {
        var table_found = false
        while let line = aStreamReader.nextLine()
        {
            if line.rangeOfString("Lookup Table") != nil
            {
                table_found = true
                println(line)
            }
            if(table_found)
            {
                self.atTable = true
                break
            }
        }
        return table_found
    }
    
    private func getTableDimensions() ->[Int]
    {
        var processing: Bool = true
        var colsrows: [Int] = [0,0]
        if(!self.atTable){findTable()}
        while(processing)
        {
            let parsedLine = getNextLine()
            if(!parsedLine.isEmpty)
            {
                if(parsedLine[0]<(0))
                {
                    processing = false
                } else {
                    colsrows[0]++
                }
                if(colsrows[1] < parsedLine.count)
                {
                    colsrows[1]=parsedLine.count
                }
            } else {
                processing = false;
            }
        }
        
        //return back to beginning of the table you were at
        aStreamReader.rewind()
        for i in 0..<self.table_num
        {
            findTable()
        }
        return colsrows
    }
    
    private func getNextLine() -> [Int]
    {
        var line: String
        var cells: [String] = Array<String>()
        var parsed_cells: [Int] = Array<Int>()
        var atEnd: Bool = false
        var processing = true
        
        while(processing)
        {
            line = aStreamReader.nextLine()!
            //split line up and remove empty elements
            for cell in line.componentsSeparatedByString(",")
            {
                if (!cell.isEmpty)
                {
                    cells.append(cell)
                }
            }
            let x = line.componentsSeparatedByString(",").count
            
            //if all cells is empty we have reached the end of our table
            if(cells.isEmpty)
            {
                atEnd = true
            } else {
                
                for cell in cells
                {
                    if((cell.toInt()) != nil)
                    {
                        parsed_cells.append(cell.toInt()!)
                    }
                }
            }
            
            /*
            * if parsed_cells is empty but were not at the end of the table.
            * This would happend because the row and col titles take up their
            * own line with no Integer elements on the line, causing a false empty
            */
            if(parsed_cells.isEmpty && atEnd)
            {
                parsed_cells.append(-1)
                processing = false
            } else if(!parsed_cells.isEmpty) {
                processing = false
            }
        }
        return parsed_cells
    }
}

class Array2D {
    var cols:Int, rows:Int
    var matrix: [Int?]
    
    
    init(cols:Int, rows:Int) {
        self.cols = cols
        self.rows = rows
        matrix = Array(count:cols*rows, repeatedValue:nil)
    }
    
    subscript(col:Int, row:Int) -> Int? {
        get {
            return matrix[cols * row + col]
        }
        set {
            matrix[cols*row+col] = newValue
        }
    }
    
    func colCount() -> Int {
        return self.cols
    }
    
    func rowCount() -> Int {
        return self.rows
    }
}

class StreamReader  {
    
    let encoding : UInt
    let chunkSize : Int
    
    var fileHandle : NSFileHandle!
    let buffer : NSMutableData!
    let delimData : NSData!
    var atEof : Bool = false
    
    init?(path: String, delimiter: String = "\n", encoding : UInt = NSUTF8StringEncoding, chunkSize : Int = 4096) {
        self.chunkSize = chunkSize
        self.encoding = encoding
        
        if let fileHandle = NSFileHandle(forReadingAtPath: path) {
            self.fileHandle = fileHandle
        } else {
            return nil
        }
        // Create NSData object containing the line delimiter:
        if let delimData = delimiter.dataUsingEncoding(NSUTF8StringEncoding) {
            self.delimData = delimData
        } else {
            return nil
        }
        if let buffer = NSMutableData(capacity: chunkSize) {
            self.buffer = buffer
        } else {
            return nil
        }
    }
    
    deinit {
        self.close()
    }
    
    /// Return next line, or nil on EOF.
    func nextLine() -> String? {
        
        if atEof {
            return nil
        }
        
        // Read data chunks from file until a line delimiter is found:
        var range = buffer.rangeOfData(delimData, options: nil, range: NSMakeRange(0, buffer.length))
        while range.location == NSNotFound {
            var tmpData = fileHandle.readDataOfLength(chunkSize)
            if tmpData.length == 0 {
                // EOF or read error.
                atEof = true
                if buffer.length > 0 {
                    // Buffer contains last line in file (not terminated by delimiter).
                    let line = NSString(data: buffer, encoding: encoding);
                    buffer.length = 0
                    return line
                }
                // No more lines.
                return nil
            }
            buffer.appendData(tmpData)
            range = buffer.rangeOfData(delimData, options: nil, range: NSMakeRange(0, buffer.length))
        }
        
        // Convert complete line (excluding the delimiter) to a string:
        let line = NSString(data: buffer.subdataWithRange(NSMakeRange(0, range.location)),
            encoding: encoding)
        // Remove line (and the delimiter) from the buffer:
        buffer.replaceBytesInRange(NSMakeRange(0, range.location + range.length), withBytes: nil, length: 0)
        
        return line
    }
    
    /// Start reading from the beginning of file.
    func rewind() -> Void {
        fileHandle.seekToFileOffset(0)
        buffer.length = 0
        atEof = false
    }
    
    /// Close the underlying file. No reading must be done after calling this method.
    func close() -> Void {
        if fileHandle != nil {
            fileHandle.closeFile()
            fileHandle = nil
        }
    }
}
