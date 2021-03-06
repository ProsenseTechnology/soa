<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:v13="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Payment/V1"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:v1="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Payment/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl v13 v1 oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:v12="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:v11="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Common/V1">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/EnterpriseObjects/Transactions/Payment/V1/PaymentEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/EO/Transactions/Payment/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="../../../../ESBMetadata/ComponentLibrary/RequesterServices/Polaris/Payment/V1/PaymentRO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/RS/Polaris/Payment/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [THU JUN 18 15:18:58 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <v1:ESBMsg>
      <v11:MsgID>
        <xsl:value-of select="/v13:ESBMsg/v12:MsgID"/>
      </v11:MsgID>
      <xsl:if test="/v13:ESBMsg/v13:RsData">
        <v1:RsData>
          <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment">
            <v1:Payment>
              <v11:BillPaymentIdentifier>
                <v11:BillPaymentStatus>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Text"/>
                </v11:BillPaymentStatus>
              </v11:BillPaymentIdentifier>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v13:PaymentType">
                <v1:PaymentType>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v13:PaymentType"/>
                </v1:PaymentType>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:BillAmount">
                <v11:BillAmount>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:BillAmount/@currencyCode">
                    <v11:CurrencyCode>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:BillAmount/@currencyCode"/>
                    </v11:CurrencyCode>
                  </xsl:if>
                </v11:BillAmount>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:TotalAmount">
                <v11:TotalAmount>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:TotalAmount/@currencyCode">
                    <v11:CurrencyCode>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:TotalAmount/@currencyCode"/>
                    </v11:CurrencyCode>
                  </xsl:if>
                </v11:TotalAmount>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:ChargeAmount">
                <v11:ChargeAmount>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:ChargeAmount/@currencyCode">
                    <v11:CurrencyCode>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:ChargeAmount/@currencyCode"/>
                    </v11:CurrencyCode>
                  </xsl:if>
                </v11:ChargeAmount>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName">
                <v12:PersonName>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName/v12:FullName">
                    <v12:FullName>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName/v12:FullName"/>
                    </v12:FullName>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName/v12:FirstName">
                    <v12:FirstName>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName/v12:FirstName"/>
                    </v12:FirstName>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName/v12:MiddleName">
                    <v12:MiddleName>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName/v12:MiddleName"/>
                    </v12:MiddleName>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName/v12:LastName">
                    <v12:LastName>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName/v12:LastName"/>
                    </v12:LastName>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName/v12:ShortName">
                    <v12:ShortName>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName/v12:ShortName"/>
                    </v12:ShortName>
                  </xsl:if>
                  <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName/v12:Title">
                    <v12:Title>
                      <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PersonName/v12:Title"/>
                    </v12:Title>
                  </xsl:if>
                </v12:PersonName>
              </xsl:if>
              <v12:Remarks>
                <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:Remarks"/>
              </v12:Remarks>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v13:ValType">
                <v12:ValType>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v13:ValType"/>
                </v12:ValType>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v13:TransactionParticulars">
                <v1:TransactionParticulars>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v13:TransactionParticulars"/>
                </v1:TransactionParticulars>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v13:ChargeEventID">
                <v1:ChargeEventID>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v13:ChargeEventID"/>
                </v1:ChargeEventID>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:BranchName">
                <v12:BranchName>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:BranchName"/>
                </v12:BranchName>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:DealerCode">
                <v12:DealerCode>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:DealerCode"/>
                </v12:DealerCode>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:UserID">
                <v1:FinacleUserID>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:UserID"/>
                </v1:FinacleUserID>
              </xsl:if>
              <xsl:if test="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PayMethod">
                <v12:PayMethod>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v13:Payment/v12:PayMethod"/>
                </v12:PayMethod>
              </xsl:if>
            </v1:Payment>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="/v13:ESBMsg/v13:RsData/v12:Status[v12:Code='ESB-00']">
              <v12:Status>
                <v12:Code>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Code"/>
                </v12:Code>
                <v12:Type>
                 <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Type"/>
                </v12:Type>
                <v12:Text>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Text"/>
                </v12:Text>
              </v12:Status>
            </xsl:when>
            <xsl:otherwise>
              <v12:Status>
                <v12:Code>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Code"/>
                </v12:Code>
                <v12:Type>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Type"/>
                </v12:Type>
                <v12:Text>
                  <xsl:value-of select="/v13:ESBMsg/v13:RsData/v12:Status/v12:Text"/>
                </v12:Text>
              </v12:Status>
            </xsl:otherwise>
          </xsl:choose>
        </v1:RsData>
      </xsl:if>
    </v1:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
