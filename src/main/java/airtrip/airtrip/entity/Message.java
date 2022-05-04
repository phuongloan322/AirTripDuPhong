package airtrip.airtrip.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Message {

    private  String status;
    private  String message;

    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private  Date date;

    public Message() {
        this.status = "success";
        this.message = "";
        this.date = new Date();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public  void  test(){
        String str = "ZZZZL <%= li %> AFFF <%= AFG %>";
        Pattern pattern = Pattern.compile("<%=(.*?)%>", Pattern.DOTALL);
        Matcher matcher = pattern.matcher(str);
        while (matcher.find()) {
            System.out.println(matcher.group(1));
        }
    }
}
