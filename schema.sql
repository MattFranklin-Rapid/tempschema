BEGIN TRANSACTION;

CREATE TABLE PriceSubCategories (
  id INT IDENTITY (1, 1),
  name NVARCHAR (100) NULL,
  category_id INT NOT NULL,
  CONSTRAINT PK_PriceSubCategories PRIMARY KEY (id)
);

CREATE TABLE PriceCategory (
  id INT IDENTITY (1, 1),
  name NVARCHAR (100) NULL,
  CONSTRAINT PK_PriceCategory PRIMARY KEY (id)
);

CREATE TABLE UnitsOfMeasure (
  id INT IDENTITY (1, 1),
  name NVARCHAR (100) NULL,
  CONSTRAINT PK_UnitsOfMeasure PRIMARY KEY (id)
);

CREATE TABLE VariationStatuses (
  id INT IDENTITY (1, 1),
  title NVARCHAR (100) NULL,
  CONSTRAINT PK_VariationStatuses PRIMARY KEY (id)
);

CREATE TABLE BuilderDetails (
  id INT IDENTITY (1, 1),
  trading_name NVARCHAR (100) NULL,
  company_name NVARCHAR (100) NULL,
  abn NVARCHAR (100) NULL,
  acn NVARCHAR (100) NULL,
  licence NVARCHAR (100) NULL,
  email NVARCHAR (100) NULL,
  phone_number NVARCHAR (100) NULL,
  address NVARCHAR (100) NULL,
  suburb NVARCHAR (100) NULL,
  postcode NVARCHAR (100) NULL,
  state_id INT NULL,
  CONSTRAINT PK_BuilderDetails PRIMARY KEY (id)
);

CREATE TABLE DocumentCategories (
  id INT IDENTITY (1, 1),
  name INT NULL,
  CONSTRAINT PK_DocumentCategories PRIMARY KEY (id)
);

CREATE TABLE ContactContractorStaff (
  contact_sub_contractor_id INT IDENTITY (1, 1),
  details_id INT NULL,
  CONSTRAINT PK_ContactContractorStaff PRIMARY KEY (contact_sub_contractor_id)
);

CREATE TABLE ContactReferrerStaff (
  contact_referrer_id INT IDENTITY (1, 1),
  details_id INT NULL,
  CONSTRAINT PK_ContactReferrerStaff PRIMARY KEY (contact_referrer_id)
);

CREATE TABLE ContactSupplierStaff (
  contact_supplier_id INT IDENTITY (1, 1),
  details_id INT NULL,
  CONSTRAINT PK_ContactSupplierStaff PRIMARY KEY (contact_supplier_id)
);

CREATE TABLE ContactStatuses (
  id INT IDENTITY (1, 1),
  title NVARCHAR (100) NULL,
  is_active BIT NULL,
  CONSTRAINT PK_ContactStatuses PRIMARY KEY (id)
);

CREATE TABLE ContactDetails (
  id INT IDENTITY (1, 1),
  first_name NVARCHAR (100) NULL,
  last_name NVARCHAR (100) NULL,
  mobile NVARCHAR (100) NULL,
  email NVARCHAR (100) NULL,
  phone NVARCHAR (100) NULL,
  job_title NVARCHAR (100) NULL,
  status_id INT NULL,
  CONSTRAINT PK_ContactDetails PRIMARY KEY (id)
);

CREATE TABLE SupplierLiscences (
  contact_supplier_id INT IDENTITY (1, 1),
  liscence_id INT NULL,
  CONSTRAINT PK_SupplierLiscences PRIMARY KEY (contact_supplier_id)
);

CREATE TABLE ContracterLiscences (
  contact_sub_contractor_id INT IDENTITY (1, 1),
  liscence_id INT NULL,
  CONSTRAINT PK_ContracterLiscences PRIMARY KEY (contact_sub_contractor_id)
);

CREATE TABLE CertificateFormTypes (
  id INT IDENTITY (1, 1),
  name VARCHAR(100) NULL,
  description VARCHAR(100) NULL,
  source VARCHAR(100) NULL,
  CONSTRAINT PK_CertificateFormTypes PRIMARY KEY (id)
);

CREATE TABLE DesignTypes (
  id INT IDENTITY (1, 1),
  name NVARCHAR (100) NULL,
  CONSTRAINT PK_DesignTypes PRIMARY KEY (id)
);

CREATE TABLE StandardDocumentLinks (
  id INT IDENTITY (1, 1),
  standard_design_id INT NULL,
  standard_document_id INT NULL,
  CONSTRAINT PK_StandardDocumentLinks PRIMARY KEY (id)
);

CREATE TABLE Users (
  id INT IDENTITY (1, 1),
  name INT NULL,
  is_active BIT NULL,
  can_login BIT NULL,
  CONSTRAINT PK_Users PRIMARY KEY (id)
);

CREATE TABLE EstimateLines (
  id INT IDENTITY (1, 1),
  estimate_id INT NULL,
  item_id INT NULL,
  qty DECIMAL NULL,
  effective_date DATETIME2 NULL,
  is_custom BIT NULL,
  custom_value DECIMAL NULL,
  custom_description NVARCHAR (100) NULL,
  custom_tax DECIMAL NULL,
  line_note NVARCHAR (100) NULL,
  CONSTRAINT PK_EstimateLines PRIMARY KEY (id)
);

CREATE TABLE Variations (
  id INT IDENTITY (1, 1),
  contract_id INT NULL,
  estimate_id INT NULL,
  title NVARCHAR (100) NULL,
  description NVARCHAR (100) NULL,
  reason NVARCHAR (100) NULL,
  status_id INT NULL,
  requested_by_id INT NULL,
  request_date DATETIME2 NULL,
  accepted_date DATETIME2 NULL,
  estimated_date DATETIME2 NULL,
  approved_date DATETIME2 NULL,
  signed_date DATETIME2 NULL,
  signed_variation_document_id INT NULL,
  recieved_variation_document_id INT NULL,
  extension_days INT NULL,
  CONSTRAINT PK_Variations PRIMARY KEY (id)
);

CREATE TABLE ExtensionsOfTime (
  id INT IDENTITY (1, 1),
  contract_id INT NULL,
  CONSTRAINT PK_ExtensionsOfTime PRIMARY KEY (id)
);

CREATE TABLE Liscences (
  id INT IDENTITY (1, 1),
  name INT NULL,
  entered DATETIME2 NULL,
  expires DATETIME2 NULL,
  CONSTRAINT PK_Liscences PRIMARY KEY (id)
);

CREATE TABLE ContactEmployees (
  id INT IDENTITY (1, 1),
  details_id INT NULL,
  dob DATETIME2 NULL,
  CONSTRAINT PK_ContactEmployees PRIMARY KEY (id)
);

CREATE TABLE ContactSubContractors (
  id INT IDENTITY (1, 1),
  primary_contact_id INT NULL,
  CONSTRAINT PK_ContactSubContractors PRIMARY KEY (id)
);

CREATE TABLE ContactReferrers (
  id INT IDENTITY (1, 1),
  primary_contact_id INT NULL,
  CONSTRAINT PK_ContactReferrers PRIMARY KEY (id)
);

CREATE TABLE ContactSuppliers (
  id INT IDENTITY (1, 1),
  primary_contact_id INT NULL,
  CONSTRAINT PK_ContactSuppliers PRIMARY KEY (id)
);

CREATE TABLE ContactClients (
  id INT IDENTITY (1, 1),
  details_id INT NULL,
  is_guarantor BIT NULL,
  CONSTRAINT PK_ContactClients PRIMARY KEY (id)
);

CREATE TABLE MaintenanceRequests (
  id INT IDENTITY (1, 1),
  job_id INT NULL,
  created_date DATETIME2 NULL,
  requester_name NVARCHAR (100) NULL,
  requester_email NVARCHAR (100) NULL,
  requester_phone NVARCHAR (100) NULL,
  request NVARCHAR (100) NULL,
  CONSTRAINT PK_MaintenanceRequests PRIMARY KEY (id)
);

CREATE TABLE Notes (
  id UNIQUEIDENTIFIER,
  table NVARCHAR (100) NULL,
  entity_id INT NULL,
  title NVARCHAR (100) NULL,
  body NVARCHAR (100) NULL,
  created_date DATETIME2 NULL,
  CONSTRAINT PK_Notes PRIMARY KEY (id)
);

CREATE TABLE Certificates (
  id INT IDENTITY (1, 1),
  job_id INT NULL,
  type_id INT NULL,
  created DATETIME2 NULL,
  document_id INT NULL,
  entered DATETIME2 NULL,
  certifier_id INT NULL,
  submitted DATETIME2 NULL,
  CONSTRAINT PK_Certificates PRIMARY KEY (id)
);

CREATE TABLE StandardDocuments (
  id INT IDENTITY (1, 1),
  CONSTRAINT PK_StandardDocuments PRIMARY KEY (id)
);

CREATE TABLE StandardCertificates (
  id INT IDENTITY (1, 1),
  standard_design_id INT NULL,
  CONSTRAINT PK_StandardCertificates PRIMARY KEY (id)
);

CREATE TABLE StandardDesigns (
  id INT IDENTITY (1, 1),
  CONSTRAINT PK_StandardDesigns PRIMARY KEY (id)
);

CREATE TABLE Allocations (
  id INT IDENTITY (1, 1),
  design_id INT NULL,
  CONSTRAINT PK_Allocations PRIMARY KEY (id)
);

CREATE TABLE Designs (
  id INT IDENTITY (1, 1),
  design_type_id INT NULL,
  CONSTRAINT PK_Designs PRIMARY KEY (id)
);

CREATE TABLE Councils (
  id INT IDENTITY (1, 1),
  state_id INT NULL,
  name NVARCHAR (100) NULL,
  CONSTRAINT PK_Councils PRIMARY KEY (id)
);

CREATE TABLE Suburbs (
  id INT IDENTITY (1, 1),
  council_id INT NULL,
  CONSTRAINT PK_Suburbs PRIMARY KEY (id)
);

CREATE TABLE StatesAUS (
  id INT IDENTITY (1, 1),
  name NVARCHAR (100) NULL,
  CONSTRAINT PK_StatesAUS PRIMARY KEY (id)
);

CREATE TABLE Covenants (
  id INT IDENTITY (1, 1),
  estate_id INT NULL,
  CONSTRAINT PK_Covenants PRIMARY KEY (id)
);

CREATE TABLE Estates (
  id INT IDENTITY (1, 1),
  property_id INT NULL,
  CONSTRAINT PK_Estates PRIMARY KEY (id)
);

CREATE TABLE PropertyAgreements (
  id INT IDENTITY (1, 1),
  property_id INT NULL,
  CONSTRAINT PK_PropertyAgreements PRIMARY KEY (id)
);

CREATE TABLE Properties (
  id INT IDENTITY (1, 1),
  suburb_id INT NULL,
  design_id INT NULL,
  CONSTRAINT PK_Properties PRIMARY KEY (id)
);

CREATE TABLE Contracts (
  id INT IDENTITY (1, 1),
  property_id INT NULL,
  owner_1_id INT NULL,
  owner_2_id INT NULL,
  owner_3_id INT NULL,
  owner_4_id INT NULL,
  contract_date DATETIME2 NULL,
  contract_price_inc DECIMAL NULL,
  contract_price_ex DECIMAL NULL,
  contract_price_gst DECIMAL NULL,
  contractor_id INT NULL,
  finance_approval BIT NULL,
  lending_body_id INT NULL,
  security_account INT NULL,
  owners_guarantor_id INT NULL,
  interest_rate DECIMAL NULL,
  description_of_works NVARCHAR (100) NULL,
  building_period INT NULL,
  commencement_date DATETIME2 NULL,
  late_completion_damages DECIMAL NULL,
  issued_date DATETIME2 NULL,
  signed_date DATETIME2 NULL,
  field_23 INT NULL,
  CONSTRAINT PK_Contracts PRIMARY KEY (id)
);

CREATE TABLE Claims (
  id INT IDENTITY (1, 1),
  activity_id INT NULL,
  contract_id INT NULL,
  request_contact_id INT NULL,
  title NVARCHAR (100) NULL,
  value DECIMAL NULL,
  date_requested DATETIME2 NULL,
  date_received DATETIME2 NULL,
  CONSTRAINT PK_Claims PRIMARY KEY (id)
);

CREATE TABLE PriceItemHistory (
  id INT IDENTITY (1, 1),
  item_id INT NULL,
  supplier_id INT NULL,
  created_date DATETIME2 NULL,
  effective_date DATETIME2 NULL,
  value MONEY NULL,
  title NVARCHAR (100) NULL,
  description NVARCHAR (100) NULL,
  item_type_id INT NULL,
  min_order_qty DECIMAL NULL,
  manufacturer_code NVARCHAR (100) NULL,
  manufacturer_description NVARCHAR (100) NULL,
  manufacturer_range NVARCHAR (100) NULL,
  manufacturer_rrp DECIMAL NULL,
  image_url NVARCHAR (100) NULL,
  datasheet_url NVARCHAR (100) NULL,
  tax_rate DECIMAL NULL,
  CONSTRAINT PK_PriceItemHistory PRIMARY KEY (id)
);

CREATE TABLE PriceItems (
  id INT IDENTITY (1, 1),
  name NVARCHAR (100) NOT NULL,
  unit_id INT NULL,
  category_id INT NULL,
  sub_category_id INT NULL,
  CONSTRAINT PK_PriceItems PRIMARY KEY (id)
);

CREATE TABLE Estimates (
  id INT IDENTITY (1, 1),
  supplier_quote_id INT NULL,
  job_id INT NULL,
  lockdown_date NVARCHAR (100) NULL,
  specifications NVARCHAR (100) NULL,
  exclusions NVARCHAR (100) NULL,
  CONSTRAINT PK_Estimates PRIMARY KEY (id)
);

CREATE TABLE SupplierQuotes (
  id INT IDENTITY (1, 1),
  supplier_id INT NULL,
  job_id INT NULL,
  effective_date DATETIME2 NULL,
  description NVARCHAR (100) NULL,
  value DECIMAL NULL,
  tax_rate DECIMAL NULL,
  CONSTRAINT PK_SupplierQuotes PRIMARY KEY (id)
);

CREATE TABLE InvoiceLines (
  id INT IDENTITY (1, 1),
  invoice_id INT NULL,
  CONSTRAINT PK_InvoiceLines PRIMARY KEY (id)
);

CREATE TABLE Invoices (
  id INT IDENTITY (1, 1),
  invoice_id INT NULL,
  value DECIMAL NULL,
  amount_paid DECIMAL NULL,
  issue_date DATETIME2 NULL,
  due_date DATETIME2 NULL,
  CONSTRAINT PK_Invoices PRIMARY KEY (id)
);

CREATE TABLE PurchaseOrderLines (
  id INT IDENTITY (1, 1),
  purchase_order_id INT NULL,
  CONSTRAINT PK_PurchaseOrderLines PRIMARY KEY (id)
);

CREATE TABLE PurchaseOrders (
  id INT IDENTITY (1, 1),
  activity_id INT NULL,
  supplier_id INT NULL,
  contractor_id INT NULL,
  CONSTRAINT PK_PurchaseOrders PRIMARY KEY (id)
);

CREATE TABLE SiteSignIns (
  id INT IDENTITY (1, 1),
  job_id INT NULL,
  name NVARCHAR (100) NULL,
  company NVARCHAR (100) NULL,
  phone_number NVARCHAR (100) NULL,
  sign_in_date DATETIME2 NULL,
  CONSTRAINT PK_SiteSignIns PRIMARY KEY (id)
);

CREATE TABLE InspectionReports (
  id INT IDENTITY (1, 1),
  activity_id INT NULL,
  CONSTRAINT PK_InspectionReports PRIMARY KEY (id)
);

CREATE TABLE Documents (
  id INT IDENTITY (1, 1),
  created DATETIME2 NULL,
  modified DATETIME2 NULL,
  title NVARCHAR (100) NULL,
  location NVARCHAR (100) NULL,
  category_id INT NULL,
  CONSTRAINT PK_Documents PRIMARY KEY (id)
);

CREATE TABLE LinkedDocuments (
  id INT IDENTITY (1, 1),
  activity_id INT NULL,
  document_id INT NULL,
  CONSTRAINT PK_LinkedDocuments PRIMARY KEY (id)
);

CREATE TABLE Activities (
  id INT IDENTITY (1, 1),
  author_id INT NULL,
  editor_id INT NULL,
  assigned_user_id INT NULL,
  job_id INT NULL,
  created_date DATETIME2 NULL,
  modified_date DATETIME2 NULL,
  start_date DATETIME2 NULL,
  end_date DATETIME2 NULL,
  has_purchase_orders BIT NULL,
  has_documents BIT NULL,
  has_inspection_reports BIT NULL,
  has_claims BIT NULL,
  default_duration INT NULL,
  CONSTRAINT PK_Activities PRIMARY KEY (id)
);

CREATE TABLE Jobs (
  id INT IDENTITY (1, 1),
  contract_id INT NULL,
  property_id INT NULL,
  CONSTRAINT PK_Jobs PRIMARY KEY (id)
);

ALTER TABLE PriceItems ADD CONSTRAINT fk_PriceSubCategories_PriceItems FOREIGN KEY (sub_category_id) REFERENCES PriceSubCategories (id);

ALTER TABLE PriceItems ADD CONSTRAINT fk_PriceCategory_PriceItems FOREIGN KEY (category_id) REFERENCES PriceCategory (id);

ALTER TABLE PriceItems ADD CONSTRAINT fk_UnitsOfMeasure_PriceItems FOREIGN KEY (unit_id) REFERENCES UnitsOfMeasure (id);

ALTER TABLE PriceItemHistory ADD CONSTRAINT fk_PriceItems_PriceItemHistory FOREIGN KEY (item_id) REFERENCES PriceItems (id);

ALTER TABLE PriceSubCategories ADD CONSTRAINT fk_PriceCategory_PriceSubCategories FOREIGN KEY (category_id) REFERENCES PriceCategory (id);

ALTER TABLE Variations ADD CONSTRAINT fk_VariationStatuses_Variations FOREIGN KEY (status_id) REFERENCES VariationStatuses (id);

ALTER TABLE Variations ADD CONSTRAINT fk_ContactClients_Variations FOREIGN KEY (requested_by_id) REFERENCES ContactClients (id);

ALTER TABLE Variations ADD CONSTRAINT fk_Documents_Variations FOREIGN KEY (recieved_variation_document_id) REFERENCES Documents (id);

ALTER TABLE Variations ADD CONSTRAINT fk_Documents_Variations FOREIGN KEY (signed_variation_document_id) REFERENCES Documents (id);

ALTER TABLE Contracts ADD CONSTRAINT fk_ContactClients_Contracts FOREIGN KEY (owners_guarantor_id) REFERENCES ContactClients (id);

ALTER TABLE Contracts ADD CONSTRAINT fk_ContactSuppliers_Contracts FOREIGN KEY (lending_body_id) REFERENCES ContactSuppliers (id);

ALTER TABLE Contracts ADD CONSTRAINT fk_BuilderDetails_Contracts FOREIGN KEY (contractor_id) REFERENCES BuilderDetails (id);

ALTER TABLE BuilderDetails ADD CONSTRAINT fk_StatesAUS_BuilderDetails FOREIGN KEY (state_id) REFERENCES StatesAUS (id);

ALTER TABLE Claims ADD CONSTRAINT fk_ContactSuppliers_Claims FOREIGN KEY (request_contact_id) REFERENCES ContactSuppliers (id);

ALTER TABLE Documents ADD CONSTRAINT fk_DocumentCategories_Documents FOREIGN KEY (category_id) REFERENCES DocumentCategories (id);

ALTER TABLE ContactContractorStaff ADD CONSTRAINT fk_ContactDetails_ContactContractorStaff FOREIGN KEY (details_id) REFERENCES ContactDetails (id);

ALTER TABLE ContactSubContractors ADD CONSTRAINT fk_ContactContractorStaff_ContactSubContractors FOREIGN KEY (id) REFERENCES ContactContractorStaff (contact_sub_contractor_id);

ALTER TABLE ContactReferrerStaff ADD CONSTRAINT fk_ContactDetails_ContactReferrerStaff FOREIGN KEY (details_id) REFERENCES ContactDetails (id);

ALTER TABLE ContactReferrers ADD CONSTRAINT fk_ContactReferrerStaff_ContactReferrers FOREIGN KEY (id) REFERENCES ContactReferrerStaff (contact_referrer_id);

ALTER TABLE ContactSupplierStaff ADD CONSTRAINT fk_ContactDetails_ContactSupplierStaff FOREIGN KEY (details_id) REFERENCES ContactDetails (id);

ALTER TABLE ContactSuppliers ADD CONSTRAINT fk_ContactSupplierStaff_ContactSuppliers FOREIGN KEY (id) REFERENCES ContactSupplierStaff (contact_supplier_id);

ALTER TABLE ContactDetails ADD CONSTRAINT fk_ContactStatuses_ContactDetails FOREIGN KEY (status_id) REFERENCES ContactStatuses (id);

ALTER TABLE ContactEmployees ADD CONSTRAINT fk_ContactDetails_ContactEmployees FOREIGN KEY (details_id) REFERENCES ContactDetails (id);

ALTER TABLE ContactSubContractors ADD CONSTRAINT fk_ContactDetails_ContactSubContractors FOREIGN KEY (primary_contact_id) REFERENCES ContactDetails (id);

ALTER TABLE ContactSuppliers ADD CONSTRAINT fk_ContactDetails_ContactSuppliers FOREIGN KEY (primary_contact_id) REFERENCES ContactDetails (id);

ALTER TABLE ContactClients ADD CONSTRAINT fk_ContactDetails_ContactClients FOREIGN KEY (details_id) REFERENCES ContactDetails (id);

ALTER TABLE SupplierLiscences ADD CONSTRAINT fk_Liscences_SupplierLiscences FOREIGN KEY (liscence_id) REFERENCES Liscences (id);

ALTER TABLE ContactSuppliers ADD CONSTRAINT fk_SupplierLiscences_ContactSuppliers FOREIGN KEY (id) REFERENCES SupplierLiscences (contact_supplier_id);

ALTER TABLE ContracterLiscences ADD CONSTRAINT fk_Liscences_ContracterLiscences FOREIGN KEY (liscence_id) REFERENCES Liscences (id);

ALTER TABLE ContactSubContractors ADD CONSTRAINT fk_ContracterLiscences_ContactSubContractors FOREIGN KEY (id) REFERENCES ContracterLiscences (contact_sub_contractor_id);

ALTER TABLE Certificates ADD CONSTRAINT fk_Documents_Certificates FOREIGN KEY (document_id) REFERENCES Documents (id);

ALTER TABLE Certificates ADD CONSTRAINT fk_CertificateFormTypes_Certificates FOREIGN KEY (type_id) REFERENCES CertificateFormTypes (id);

ALTER TABLE Designs ADD CONSTRAINT fk_DesignTypes_Designs FOREIGN KEY (design_type_id) REFERENCES DesignTypes (id);

ALTER TABLE Certificates ADD CONSTRAINT fk_Jobs_Certificates FOREIGN KEY (job_id) REFERENCES Jobs (id);

ALTER TABLE StandardCertificates ADD CONSTRAINT fk_StandardDesigns_StandardCertificates FOREIGN KEY (standard_design_id) REFERENCES StandardDesigns (id);

ALTER TABLE StandardDocumentLinks ADD CONSTRAINT fk_StandardDocuments_StandardDocumentLinks FOREIGN KEY (standard_document_id) REFERENCES StandardDocuments (id);

ALTER TABLE StandardDocumentLinks ADD CONSTRAINT fk_StandardDesigns_StandardDocumentLinks FOREIGN KEY (standard_design_id) REFERENCES StandardDesigns (id);

ALTER TABLE Properties ADD CONSTRAINT fk_Designs_Properties FOREIGN KEY (design_id) REFERENCES Designs (id);

ALTER TABLE Covenants ADD CONSTRAINT fk_Estates_Covenants FOREIGN KEY (estate_id) REFERENCES Estates (id);

ALTER TABLE Estates ADD CONSTRAINT fk_Properties_Estates FOREIGN KEY (property_id) REFERENCES Properties (id);

ALTER TABLE PropertyAgreements ADD CONSTRAINT fk_Properties_PropertyAgreements FOREIGN KEY (property_id) REFERENCES Properties (id);

ALTER TABLE Suburbs ADD CONSTRAINT fk_Councils_Suburbs FOREIGN KEY (council_id) REFERENCES Councils (id);

ALTER TABLE Councils ADD CONSTRAINT fk_StatesAUS_Councils FOREIGN KEY (state_id) REFERENCES StatesAUS (id);

ALTER TABLE Properties ADD CONSTRAINT fk_Suburbs_Properties FOREIGN KEY (suburb_id) REFERENCES Suburbs (id);

ALTER TABLE Contracts ADD CONSTRAINT fk_ContactClients_Contracts FOREIGN KEY (owner_4_id) REFERENCES ContactClients (id);

ALTER TABLE Contracts ADD CONSTRAINT fk_ContactClients_Contracts FOREIGN KEY (owner_3_id) REFERENCES ContactClients (id);

ALTER TABLE Contracts ADD CONSTRAINT fk_ContactClients_Contracts FOREIGN KEY (owner_2_id) REFERENCES ContactClients (id);

ALTER TABLE Contracts ADD CONSTRAINT fk_ContactClients_Contracts FOREIGN KEY (owner_1_id) REFERENCES ContactClients (id);

ALTER TABLE Contracts ADD CONSTRAINT fk_Properties_Contracts FOREIGN KEY (property_id) REFERENCES Properties (id);

ALTER TABLE Jobs ADD CONSTRAINT fk_Properties_Jobs FOREIGN KEY (property_id) REFERENCES Properties (id);

ALTER TABLE Jobs ADD CONSTRAINT fk_Contracts_Jobs FOREIGN KEY (contract_id) REFERENCES Contracts (id);

ALTER TABLE MaintenanceRequests ADD CONSTRAINT fk_Jobs_MaintenanceRequests FOREIGN KEY (job_id) REFERENCES Jobs (id);

ALTER TABLE SiteSignIns ADD CONSTRAINT fk_Jobs_SiteSignIns FOREIGN KEY (job_id) REFERENCES Jobs (id);

ALTER TABLE Activities ADD CONSTRAINT fk_Jobs_Activities FOREIGN KEY (job_id) REFERENCES Jobs (id);

ALTER TABLE Claims ADD CONSTRAINT fk_Contracts_Claims FOREIGN KEY (contract_id) REFERENCES Contracts (id);

ALTER TABLE Claims ADD CONSTRAINT fk_Activities_Claims FOREIGN KEY (activity_id) REFERENCES Activities (id);

ALTER TABLE Activities ADD CONSTRAINT fk_Users_Activities FOREIGN KEY (assigned_user_id) REFERENCES Users (id);

ALTER TABLE Activities ADD CONSTRAINT fk_Users_Activities FOREIGN KEY (editor_id) REFERENCES Users (id);

ALTER TABLE Activities ADD CONSTRAINT fk_Users_Activities FOREIGN KEY (author_id) REFERENCES Users (id);

ALTER TABLE InspectionReports ADD CONSTRAINT fk_Activities_InspectionReports FOREIGN KEY (activity_id) REFERENCES Activities (id);

ALTER TABLE LinkedDocuments ADD CONSTRAINT fk_Documents_LinkedDocuments FOREIGN KEY (document_id) REFERENCES Documents (id);

ALTER TABLE LinkedDocuments ADD CONSTRAINT fk_Activities_LinkedDocuments FOREIGN KEY (activity_id) REFERENCES Activities (id);

ALTER TABLE InvoiceLines ADD CONSTRAINT fk_Invoices_InvoiceLines FOREIGN KEY (invoice_id) REFERENCES Invoices (id);

ALTER TABLE PurchaseOrderLines ADD CONSTRAINT fk_PurchaseOrders_PurchaseOrderLines FOREIGN KEY (purchase_order_id) REFERENCES PurchaseOrders (id);

ALTER TABLE Invoices ADD CONSTRAINT fk_PurchaseOrders_Invoices FOREIGN KEY (invoice_id) REFERENCES PurchaseOrders (id);

ALTER TABLE PurchaseOrders ADD CONSTRAINT fk_ContactSubContractors_PurchaseOrders FOREIGN KEY (contractor_id) REFERENCES ContactSubContractors (id);

ALTER TABLE PurchaseOrders ADD CONSTRAINT fk_ContactSuppliers_PurchaseOrders FOREIGN KEY (supplier_id) REFERENCES ContactSuppliers (id);

ALTER TABLE PurchaseOrders ADD CONSTRAINT fk_Activities_PurchaseOrders FOREIGN KEY (activity_id) REFERENCES Activities (id);

ALTER TABLE SupplierQuotes ADD CONSTRAINT fk_Jobs_SupplierQuotes FOREIGN KEY (job_id) REFERENCES Jobs (id);

ALTER TABLE Estimates ADD CONSTRAINT fk_Jobs_Estimates FOREIGN KEY (job_id) REFERENCES Jobs (id);

ALTER TABLE SupplierQuotes ADD CONSTRAINT fk_ContactSuppliers_SupplierQuotes FOREIGN KEY (supplier_id) REFERENCES ContactSuppliers (id);

ALTER TABLE Estimates ADD CONSTRAINT fk_SupplierQuotes_Estimates FOREIGN KEY (supplier_quote_id) REFERENCES SupplierQuotes (id);

ALTER TABLE PriceItemHistory ADD CONSTRAINT fk_ContactSuppliers_PriceItemHistory FOREIGN KEY (supplier_id) REFERENCES ContactSuppliers (id);

ALTER TABLE EstimateLines ADD CONSTRAINT fk_PriceItems_EstimateLines FOREIGN KEY (item_id) REFERENCES PriceItems (id);

ALTER TABLE Variations ADD CONSTRAINT fk_Estimates_Variations FOREIGN KEY (estimate_id) REFERENCES Estimates (id);

ALTER TABLE EstimateLines ADD CONSTRAINT fk_Estimates_EstimateLines FOREIGN KEY (estimate_id) REFERENCES Estimates (id);

ALTER TABLE Variations ADD CONSTRAINT fk_Contracts_Variations FOREIGN KEY (contract_id) REFERENCES Contracts (id);

ALTER TABLE ExtensionsOfTime ADD CONSTRAINT fk_Contracts_ExtensionsOfTime FOREIGN KEY (contract_id) REFERENCES Contracts (id);

ALTER TABLE Allocations ADD CONSTRAINT fk_Designs_Allocations FOREIGN KEY (design_id) REFERENCES Designs (id);

COMMIT;
