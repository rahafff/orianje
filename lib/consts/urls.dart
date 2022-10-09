class Urls {
//  static const String DOMAIN = 'http://ahdhilali-001-site8.itempurl.com/api/';
  static const String DOMAIN = 'http://tellotechnology-001-site1.atempurl.com/api/';
  static const String BASE_API = DOMAIN + '';

  static const String INVOICE_API = DOMAIN + 'services/app/InvoiceService';
  static const String MAIL_API = DOMAIN + 'services/app/MailService';
  static const String EMPLOYEE_API = DOMAIN + 'services/app/EmployeeService';
  static const String FILE = DOMAIN + 'File';
  static const String USER = DOMAIN + 'services/app/User';
  static const String CLIENT_API = DOMAIN + 'services/app/ClientService';

  static const String LOGIN = DOMAIN + 'TokenAuth/Authenticate';

  //-----------------Invoice---------------
  static const String CREATE_INVOICE = INVOICE_API + '/CreateWithAttachments';
  static const String GET_INVOICES = INVOICE_API + '/GetInvoices';
  static const String GET_INVOICE_DETAILS = INVOICE_API + '/GetInvoice';

  static const String PAID_INVOICE  = INVOICE_API + '/Pay';
  static const String UNPAID_INVOICE = INVOICE_API + '/UnPay';

  //-----------------Mails---------------
  static const String CREATE_MAIL = MAIL_API + '/CreateWithAttachments';
  static const String GET_MAILS = MAIL_API + '/GetMails';
  static const String GET_MAIL_DETAILS = MAIL_API + '/GetMail';

  //---------------upload-------------//
  static const String UPLOAD_FILE = FILE + '/Upload';

  //-----------------Employee---------------
  static const String CREATE_EMP_RECORD = EMPLOYEE_API + '/CreateRecord';
  static const String UPDATE_EMP_RECORD = EMPLOYEE_API + '/UpdateRecord';
  static const String GET_EMPLOYEES = EMPLOYEE_API + '/GetEmployees';
  static const String GET_EMPLOYEE_RECORD = EMPLOYEE_API + '/GetRecords';

  //------CLIENT----------------
  static const String CHANGE_PASS = USER + '/ChangePassword';
  //------USER----------------
  static const String GET_CLIENT_MSG = CLIENT_API + '/GetClientMessages';
}
