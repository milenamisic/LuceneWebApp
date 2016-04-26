package logic;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.apache.lucene.store.Directory;
import org.apache.lucene.store.RAMDirectory;

import model.Result;

public class LuceneWrapper {

	Directory directory;
	Indexer indexer;
	Searcher searcher;
	
	public LuceneWrapper() throws IOException{
		directory = new RAMDirectory();

		Indexer indexer = new Indexer(directory);
		indexer.indexDocuments(Paths.get("G:\\Projekti - Milena\\Lucene\\LuceneWebApp\\src\\files"));

		searcher = new Searcher();
		searcher.startSearcher(directory);
	}
	
	public ArrayList<Result> search(String querystring) throws IOException{
		return searcher.search(querystring);
	}
	
	public void close() throws IOException{
		searcher.stopSearcher();
		directory.close();
	}
	
}
