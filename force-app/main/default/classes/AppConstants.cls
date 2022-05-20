public with sharing class AppConstants {

	/* Service response error messages */
	public static final String ERROR_MSG_UNEXPECTED_ERROR_OCCURED = 'Unexcepted exception encountered, please try again later';
	public static final String SVC_RESP_MESSAGE_INVALID_SVCNAME = 'Invalid service requested, please check the service name requested for';
	public static final String RESPONSE_SUCCESS_CODE = 'SUCCESS';
    public static final String RESPONSE_FAILURE_ERROR_CODE = 'FAILURE';


    /*  Service name constants */
    public static final String SVC_INSERT_ACC = 'InsertAccountService';
    public static final String SVC_SEARCH_CON = 'SearchContactService';
    public static final String SVC_EMAIL_DOMAIN_GET = 'GetEmailDomainList';
    public static final String SVC_EMAIL_DOMAIN_UPDATE = 'UpdateNewEmailDomain';

    /*  Serach utility constants */
    public static final String SEARCH_RECORDS_DEFAULT_LIMIT = '100';
    public static final integer PAGINATION_INDEX = 0;
    public static final integer PAGINATION_BLOCK_SIZE = 100;


}