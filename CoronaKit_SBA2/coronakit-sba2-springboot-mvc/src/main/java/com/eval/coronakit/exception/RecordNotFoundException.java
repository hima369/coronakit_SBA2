package com.eval.coronakit.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_FOUND)
public class RecordNotFoundException extends RuntimeException {
	
    private String exceptionDetail;
    private Object fieldValue;

    public RecordNotFoundException( String exceptionDetail, int productId) {
        super(exceptionDetail+" - "+productId);
        this.exceptionDetail = exceptionDetail;
        this.fieldValue = productId;
    }

    public String getExceptionDetail() {
        return exceptionDetail;
    }

    public Object getFieldValue() {
        return fieldValue;
    }
}