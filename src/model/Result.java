package model;

import java.text.DecimalFormat;

public class Result {

	private String documentPath;
	private float score;
	
	public Result(String documentPath, float score){
		this.documentPath = documentPath;
		this.score = score;
	}
	
	public String getDocumentName(){
		return documentPath.substring(documentPath.lastIndexOf("\\")+1);
	}
	
	public String printScore(){
		return (new DecimalFormat("0.000")).format(score);
	}
	
	public String getDocumentPath() {
		return documentPath;
	}
	public void setDocumentPath(String documentPath) {
		this.documentPath = documentPath;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	
}
