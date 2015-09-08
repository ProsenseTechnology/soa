<xsl:stylesheet version="1.0"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 oraxsl DVMFunctions BasicCredentialsUserFunction UUIDUserFunction IsUserInRoleFunction IsUserInGroupFunction XrefFunctions"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ProviderComponents/PSC/Transactions/Bill/V1"
                xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.soa-utilities.com/osb/custom/xpath/utilties.xpath.extensions.DateFunctions"
                xmlns:util7X="http://www.soa-utilities.com/osb/custom/xpath/utilties.xpath.extensions.DateFunctions"
                xmlns:dat="http://www.soa-utilities.com/osb/custom/xpath/utilties.xpath.extensions.DateFunctions"
                xmlns:DVMFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.dvm.DVMFunctions"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:BasicCredentialsUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.BasicCredentialsUserFunction"
                xmlns:UUIDUserFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.UUIDUserFunction"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:IsUserInRoleFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInRoleFunction"
                xmlns:IsUserInGroupFunction="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.stages.functions.IsUserInGroupFunction"
                xmlns:XrefFunctions="http://www.oracle.com/XSL/Transform/java/com.bea.wli.sb.functions.xref.XrefFunctions"
                xmlns:oracFT="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:StringFunctions="http://www.oracle.com/XSL/Transform/java/utilties.xpath.extensions.StringFunctions"
                xmlns:oracEj="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:oracFf="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:DateFunctions="http://www.oracle.com/XSL/Transform/java/utilties.xpath.extensions.DateFunctions"
                xmlns:LookupTable="http://www.oracle.com/XSL/Transform/java/soa.utilities.dvm.LookupTable">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="../XSD/ChaiBillPSM.xsd"/>
        <oracle-xsl-mapper:rootElement name="ChaiBillRequestPSM"
                                       namespace="http://xmlns.equitybank.co.ke/ProviderComponents/PSC/Transactions/Bill/V1"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets/>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [TUE MAY 05 17:32:06 EAT 2015].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <BillRequest>
      <BillHeader>
        <password>
          <xsl:value-of select='string ("2323323" )'/>
        </password>
        <user>
          <xsl:value-of select='string ("user" )'/>
        </user>
      </BillHeader>
      <checkSum>
        <xsl:value-of select='string ("QmlsbHtiaWxsZXJDb2RlPTI1NDc4LCBiaWxsUmVmZXJlbmNlTnVtYmVyPTEyMjMzLCBhbW91bnQ9MTAwLjAsIEN1cnJlbmN5PUtFUywgdHhuUmVmTnVtYmVyPTIyMzIyLCBjaGFubmVsSWQ9V0FSSUQsIHRlbGxlcklkPW51bGwsIHBheW1lbnRUeXBlPUNBU0h9" )'/>
      </checkSum>
      <billDetails>
        <Billercode>
          <xsl:value-of select="/ns0:ChaiBillRequestPSM/ns0:DataArea/ns0:SourceSystem"/>
        </Billercode>
        <BillNumber>
          <xsl:value-of select="/ns0:ChaiBillRequestPSM/ns0:DataArea/ns0:PaymentRef"/>
        </BillNumber>
        <Description>
          <xsl:value-of select="/ns0:ChaiBillRequestPSM/ns0:DataArea/ns0:Description"/>
        </Description>
        <CustomerName>
          <xsl:value-of select="/ns0:ChaiBillRequestPSM/ns0:DataArea/ns0:CustomerName"/>
        </CustomerName>
        <CreationDate>
          <xsl:value-of select="substring-after(/ns0:ChaiBillRequestPSM/ns0:DataArea/ns0:UserID,'@')"/>
        </CreationDate>
        <Amount>
          <xsl:value-of select="/ns0:ChaiBillRequestPSM/ns0:DataArea/ns0:Amount"/>
        </Amount>
        <CurrencyCode>
          <xsl:value-of select="/ns0:ChaiBillRequestPSM/ns0:DataArea/ns0:CurrencyCode"/>
        </CurrencyCode>
        <ExpiryDate>
          <xsl:value-of select="string('')"/>
        </ExpiryDate>
        <CustomerIdNumber>
          <xsl:value-of select="substring-before(/ns0:ChaiBillRequestPSM/ns0:DataArea/ns0:UserID,'@')"/>
        </CustomerIdNumber>
        <Mobile>
          <xsl:value-of select="/ns0:ChaiBillRequestPSM/ns0:DataArea/ns0:Mobile"/>
        </Mobile>
        <TransactionType>
          <xsl:value-of select='string ("Offline" )'/>
        </TransactionType>
      </billDetails>
    </BillRequest>
  </xsl:template>
</xsl:stylesheet>