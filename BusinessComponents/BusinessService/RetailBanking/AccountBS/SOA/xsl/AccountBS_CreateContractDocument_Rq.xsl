<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:tns="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Document/V1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns0="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:eo="http://xmlns.equitybank.co.ke/ESB/EO/Accounts/Account/V1"
                xmlns:com="http://xmlns.equitybank.co.ke/ESB/EO/Common/V1"
                xmlns:bio="http://xmlns.equitybank.co.ke/ESB/EO/Resilience/Biometric/V1"
                xmlns:custeo="http://xmlns.equitybank.co.ke/ESB/EO/Parties/Customer/V1"
                xmlns:ns1="http://xmlns.equitybank.co.ke/ESB/EO/Misc/File/V1">
  <oracle-xsl-mapper:schema>
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/BusinessServices/RetailBanking/Account/V1/AccountBO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"/>
        <oracle-xsl-mapper:param name="accountOpeningDO"/>
      </oracle-xsl-mapper:source>
      <oracle-xsl-mapper:source type="XSD">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/BusinessServices/RetailBanking/Account/V1/AccountBO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg"
                                       namespace="http://xmlns.equitybank.co.ke/ESB/BO/RetailBanking/Account/V1"/>
        <oracle-xsl-mapper:param name="accountOpeningRespDO"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="XSD">
        <oracle-xsl-mapper:schema location="oramds:/apps/ESBMetadata/ComponentLibrary/EnterpriseObjects/Misc/Document/V1/DocumentEO.xsd"/>
        <oracle-xsl-mapper:rootElement name="ESBMsg" namespace="http://xmlns.equitybank.co.ke/ESB/EO/Misc/Document/V1"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
  </oracle-xsl-mapper:schema>
  <xsl:param name="accountOpeningRespDO"/>
  <xsl:template match="/">
    <tns:ESBMsg>
      <com:MsgID>
        <xsl:value-of select="/ns0:ESBMsg/com:MsgID"/>
      </com:MsgID>
      <com:Source>
        <xsl:value-of select="/ns0:ESBMsg/com:Source"/>
      </com:Source>
      <com:MsgType>
        <xsl:value-of select="/ns0:ESBMsg/com:MsgType"/>
      </com:MsgType>
      <com:Service>
        <xsl:value-of select="/ns0:ESBMsg/com:Service"/>
      </com:Service>
      <tns:RqData actionCode="CreateDocument">
        <tns:Document>
          <tns:DocumentType>
            <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:TermsAndCondition/com:AgreementDocument/@mimeCode"/>
          </tns:DocumentType>
          <tns:DocumentName>
            <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:TermsAndCondition/com:AgreementDocument/@fileName"/>
          </tns:DocumentName>
          <tns:DocumentTypeID>REMOTE_MOBILE</tns:DocumentTypeID>
          <tns:DocumentSubTypeID>
            <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:Person/com:IdentityDocument/com:IdentityDocumentID"/>
          </tns:DocumentSubTypeID>
          <tns:DocumentCreatedBy>TABUSR</tns:DocumentCreatedBy>
          <tns:DocumentUpdatedBy>TABUSR</tns:DocumentUpdatedBy>
          <tns:DocumentFileContent mimeCode="{/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:TermsAndCondition/com:AgreementDocument/@mimeCode}"
                                   characterSetCode="{/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:TermsAndCondition/com:AgreementDocument/@characterSetCode}"
                                   fileName="{/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:TermsAndCondition/com:AgreementDocument/@fileName}">
            <xsl:value-of select="/ns0:ESBMsg/ns0:RqData/custeo:Customer/com:TermsAndCondition/com:AgreementDocument"/>
          </tns:DocumentFileContent>
          <tns:DocumentStatus>1</tns:DocumentStatus>
        </tns:Document>
      </tns:RqData>
    </tns:ESBMsg>
  </xsl:template>
</xsl:stylesheet>
