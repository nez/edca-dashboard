package main

import (
	"bufio"
	"encoding/csv"
	"io"
	"os"
	"strings"
)

func main() {
	// Load a TXT file.
	f, _ := os.Open("json_filenames.csv")
	r := csv.NewReader(bufio.NewReader(f))
	w := csv.NewWriter(os.Stdout)

	keywords := "contrataciones-abiertas, ocds"
	//  modified := ""
	contact := "Jaime Madinaveitia Villanueva"
	mbox := "jaime.madinaveitia@gacm.mx"
	w.Write([]string{"ds:identifier", "ds:title", "ds:description", "ds:keyword", "ds:modified", "ds:contactPoint", "ds:mbox", "ds:temporal", "ds:spatial", "ds:landingPage", "ds:accrualPeriodicity", "rs:title", "rs:description", "rs:downloadURL", "rs:mediaType", "rs:byteSize", "rs:temporal", "rs:spatial"})

	for {
		record, err := r.Read()

		if err == io.EOF {
			break
		}

		title := strings.Replace(record[3], "\"", "", -1)
		title = strings.Replace(title, ".", "", -1)

		id := strings.Replace(record[1], "/", "-", -1)
		id = strings.Replace(id, "_", "-", -1)
		id = strings.Replace(id, ".", "-", -1)
		/*
		   if strings.Count(title,".") > 1 {
		     fmt.Println(title)
		   }
		*/
		row := []string{"", id + " " + title, record[3], keywords, "2017/01/23", contact, mbox, "", "", "", "",
			"JSON de " + id + " " + title, record[3], "http://cdn.datos.gob.mx/public/gacm/" + id + "/" + id + ".json", "json", "", "", ""}
		w.Write(row)

		row = []string{"", id + " " + title, record[3], keywords, "2017/01/23", contact, mbox, "", "", "", "",
			"XLSX de " + id + " " + title, record[3], "http://cdn.datos.gob.mx/public/gacm/" + id + "/" + id + ".xlsx", "xlsx", "", "", ""}
		w.Write(row)

		row = []string{"", id + " " + title, record[3], keywords, "2017/01/23", contact, mbox, "", "", "", "",
			"PDF de " + id + " " + title, record[3], "http://cdn.datos.gob.mx/public/gacm/" + id + "/" + id + ".pdf", "pdf", "", "", ""}
		w.Write(row)

		/*
			row = []string{"", "\"" + title + "\"", record[3], keywords, "18-jul-2016", contact, mbox, "", "", "", "",
				"\"" + title + " en CSV\"", record[3], "http://cdn.datos.gob.mx/public/gacm/" + id + "/" + id + ".csv", "csv", "", "", ""}
			w.Write(row)
		*/

		/*
		   if err := w.Write(row); err != nil {
		     fmt.Println("error writing record to csv:", err)
		   }
		*/
		//fmt.Println(record[3])
	}
	w.Flush()

}
