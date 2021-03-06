<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:app="http://xmlns.equitybank.co.ke/ESB/PS/Finacle/Adapter/db"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsi oracle-xsl-mapper xsl xsd app tns oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:acceo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../Adapter/db/FIN_DB_Adapter.xsd"/>
        <oracle-xsl-mapper:rootElement name="QueryCustomerMasterOutputCollection"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/PS/Finacle/Adapter/db"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Parties/Customer/V1/CustomerEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [SAT MAY 09 11:42:31 IST 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <eo:ESBMsg>
      <eo:RsData>
        <xsl:for-each select="/app:QueryCustomerMasterOutputCollection/app:QueryCustomerMasterOutput">
          <eo:Customer>
            <com:CustomerIdentifier>
              <com:BankID>
                <xsl:value-of select="app:BankId"/>
              </com:BankID>
              <com:CustomerID>
                <xsl:value-of select="app:CustomerId"/>
              </com:CustomerID>
              <com:BranchID>
                <xsl:value-of select="app:BranchCode"/>
              </com:BranchID>
            </com:CustomerIdentifier>
            <com:Person>
              <com:PersonName>
                <com:FullName>
                  <xsl:value-of select="app:CustName"/>
                </com:FullName>
                <com:ShortName>
                  <xsl:value-of select="app:RMName"/>
                </com:ShortName>
              </com:PersonName>
              <com:IdentityDocument>
                <com:IdentityDocumentID>
                  <xsl:value-of select="app:PrimaryID"/>
                </com:IdentityDocumentID>
              </com:IdentityDocument>
            </com:Person>
            <com:Address>
              <com:LineOne>
                <xsl:value-of select="app:Address1"/>
              </com:LineOne>
              <com:LineTwo>
                <xsl:value-of select="app:Address2"/>
              </com:LineTwo>
              <com:LineThree>
                <xsl:value-of select="app:Address3"/>
              </com:LineThree>
              <com:CityName>
                <xsl:value-of select="app:CityTown"/>
              </com:CityName>
              <com:CountyName/>
              <com:CountryName>
                <xsl:value-of select="app:CountryCode"/>
              </com:CountryName>
              <com:PostalCode>
                <xsl:value-of select="app:ZipCode"/>
              </com:PostalCode>
            </com:Address>
            <com:Phone>
              <com:PhoneType>PHONE</com:PhoneType>
              <com:CompleteNumber>
                <xsl:value-of select="app:PhoneNo"/>
              </com:CompleteNumber>
            </com:Phone>
            <com:Phone>
              <com:PhoneType>CELL</com:PhoneType>
              <com:CompleteNumber>
                <xsl:value-of select="app:CellNo"/>
              </com:CompleteNumber>
            </com:Phone>
            <xsl:if test="string-length (app:EmailID/text()) >0">
              <com:Email>
                <com:EmailAddress>
                  <xsl:value-of select="app:EmailID"/>
                </com:EmailAddress>
              </com:Email>
            </xsl:if>
            <eo:CustomerStatus>
              <xsl:value-of select="app:Status"/>
            </eo:CustomerStatus>
          </eo:Customer>
        </xsl:for-each>
        <xsl:if test="count (/app:QueryCustomerMasterOutputCollection/app:QueryCustomerMasterOutput ) > 0">
          <com:Status>
            <com:Code>ESB-00</com:Code>
            <com:Type>Success</com:Type>
            <com:Text>Customer master data queried successfully</com:Text>
          </com:Status>
        </xsl:if>
        <xsl:if test="count (/app:QueryCustomerMasterOutputCollection/app:QueryCustomerMasterOutput ) &lt;= 0">
          <com:Status>
            <com:Code>ESB-100</com:Code>
            <com:Type>Failue</com:Type>
            <com:Text>Customer master details not found</com:Text>
          </com:Status>
        </xsl:if>
      </eo:RsData>
    </eo:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
